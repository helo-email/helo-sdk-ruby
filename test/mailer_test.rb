# frozen_string_literal: true

require "test_helper"
require "json"
require "mail"

class MailerTest < Minitest::Test
  SEND_URL = "http://localhost:8002/send/transactional"
  MESSAGE_ID = "550e8400-e29b-41d4-a716-446655440000"

  def setup
    stub_request(:post, SEND_URL).to_return(
      status: 200,
      body: { status: "accepted", messageId: MESSAGE_ID }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end

  def test_sends_addresses_subject_and_bodies
    mail = build_mail do
      from "Sender Name <sender@example.com>"
      to ["one@example.com", "Two <two@example.com>"]
      cc "cc@example.com"
      bcc "bcc@example.com"
      reply_to "reply@example.com"
      subject "Hello"
      text_part { body "plain body" }
      html_part do
        content_type "text/html; charset=UTF-8"
        body "<b>html body</b>"
      end
    end

    deliver(mail)

    assert_requested(:post, SEND_URL) do |request|
      body = JSON.parse(request.body)
      assert_equal({ "email" => "sender@example.com", "name" => "Sender Name" }, body["from"])
      assert_equal [{ "email" => "one@example.com" }, { "email" => "two@example.com", "name" => "Two" }], body["to"]
      assert_equal [{ "email" => "cc@example.com" }], body["cc"]
      assert_equal [{ "email" => "bcc@example.com" }], body["bcc"]
      assert_equal [{ "email" => "reply@example.com" }], body["replyTo"]
      assert_equal "Hello", body["subject"]
      assert_equal "plain body", body["text"]
      assert_equal "<b>html body</b>", body["html"]
    end
  end

  def test_sends_a_single_part_message_by_its_content_type
    deliver(build_mail { body "just text" })
    assert_requested(:post, SEND_URL) do |request|
      body = JSON.parse(request.body)
      assert_equal "just text", body["text"]
      refute body.key?("html")
    end

    html = build_mail do
      content_type "text/html; charset=UTF-8"
      body "<p>just html</p>"
    end
    deliver(html)
    assert_requested(:post, SEND_URL) do |request|
      body = JSON.parse(request.body)
      body["html"] == "<p>just html</p>" && !body.key?("text")
    end
  end

  def test_sends_attachments_base64_encoded
    mail = build_mail do
      body "see attached"
      add_file filename: "report.pdf", content: "%PDF-1.4"
    end
    mail.attachments.inline["logo.png"] = "PNG"
    logo_cid = mail.attachments["logo.png"].cid

    deliver(mail)

    assert_requested(:post, SEND_URL) do |request|
      attachments = JSON.parse(request.body)["attachments"].to_h { |a| [a["fileName"], a] }

      assert_equal "attachment", attachments["report.pdf"]["disposition"]
      assert_equal "%PDF-1.4", attachments["report.pdf"]["content"].unpack1("m0")
      assert_equal "application/pdf", attachments["report.pdf"]["contentType"]
      refute attachments["report.pdf"].key?("contentId")

      assert_equal "inline", attachments["logo.png"]["disposition"]
      assert_equal logo_cid, attachments["logo.png"]["contentId"]
    end
  end

  def test_sends_delivery_method_options_and_custom_headers
    mail = build_mail { body "hi" }
    mail["X-Campaign"] = "spring"

    deliver(mail, tags: ["welcome", "onboarding"], metadata: { user_id: "42" },
                  tracking: { opens: true, links: false },
                  channel_id: "channel-from-message", idempotency_key: "order-1")

    assert_requested(:post, SEND_URL) do |request|
      body = JSON.parse(request.body)
      assert_equal ["welcome", "onboarding"], body["tags"]
      assert_equal({ "user_id" => "42" }, body["metadata"])
      assert_equal({ "opens" => true, "links" => false }, body["tracking"])
      assert_equal({ "X-Campaign" => "spring" }, body["headers"])
      assert_equal "channel-from-message", request.headers["X-Helo-Channel-Id"]
      assert_equal "order-1", request.headers["X-Helo-Idempotency-Key"]
    end
  end

  def test_records_the_api_message_id_and_returns_the_response
    mail = build_mail { body "hi" }
    response = deliver(mail)

    assert_equal MESSAGE_ID, response.message_id
    assert_equal MESSAGE_ID, mail[:helo_message_id].value
    refute_equal MESSAGE_ID, mail.message_id
  end

  def test_rejects_an_unparseable_address_before_sending
    error = assert_raises(ArgumentError) { deliver(build_mail { to "not an address, @@"; body "hi" }) }

    assert_match(/Invalid To address: not an address, @@/, error.message)
    assert_not_requested(:post, SEND_URL)
  end

  def test_resending_the_same_message_keeps_one_id_and_does_not_forward_it
    mail = build_mail { body "hi" }
    2.times { deliver(mail) }

    assert_equal MESSAGE_ID, mail[:helo_message_id].value
    assert_requested(:post, SEND_URL, times: 2) { |request| JSON.parse(request.body)["headers"].nil? }
  end

  def test_raises_api_errors
    stub_request(:post, SEND_URL).to_return(status: 422, body: "{}", headers: { "Content-Type" => "application/json" })

    assert_raises(Helo::APIError) { deliver(build_mail { body "hi" }) }
  end

  private

  def build_mail(&block)
    mail = Mail.new(&block)
    mail.from ||= "sender@example.com"
    mail.to ||= "recipient@example.com"
    mail.subject ||= "Subject"
    mail
  end

  def deliver(mail, **options)
    mail.delivery_method(Helo::Mailer, options)
    mail.deliver!
  end
end

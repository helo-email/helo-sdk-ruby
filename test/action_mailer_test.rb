# frozen_string_literal: true

require "test_helper"
require "json"
require "action_mailer"

ActionMailer::Base.add_delivery_method :helo, Helo::Mailer
ActionMailer::Base.delivery_method = :helo

class ActionMailerTest < Minitest::Test
  SEND_URL = "http://localhost:8002/send/transactional"
  MESSAGE_ID = "550e8400-e29b-41d4-a716-446655440000"

  class WelcomeMailer < ActionMailer::Base
    default from: "sender@example.com", delivery_method_options: { tags: ["default"] }
    before_action { headers["X-From-Callback"] = "1" }

    def welcome
      headers["X-Campaign"] = "spring"
      mail(to: "recipient@example.com", subject: "Welcome", body: "hi",
           delivery_method_options: { tags: ["welcome"], metadata: { user_id: "42" },
                                      channel_id: "channel-1", idempotency_key: "welcome-42" })
    end

    def plain
      mail(to: "recipient@example.com", subject: "Plain", body: "hi")
    end
  end

  def setup
    stub_request(:post, SEND_URL).to_return(
      status: 200,
      body: { status: "accepted", messageId: MESSAGE_ID }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end

  def test_sends_delivery_method_options_and_custom_headers
    message = WelcomeMailer.welcome.deliver_now

    assert_requested(:post, SEND_URL) do |request|
      body = JSON.parse(request.body)
      assert_equal ["welcome"], body["tags"]
      assert_equal({ "user_id" => "42" }, body["metadata"])
      assert_equal({ "X-From-Callback" => "1", "X-Campaign" => "spring" }, body["headers"])
      assert_equal "channel-1", request.headers["X-Helo-Channel-Id"]
      assert_equal "welcome-42", request.headers["X-Helo-Idempotency-Key"]
    end
    refute(message.header_fields.any? { |field| %w[tags metadata].include?(field.name.downcase) })
  end

  def test_falls_back_to_the_mailer_defaults
    WelcomeMailer.plain.deliver_now

    assert_requested(:post, SEND_URL) { |request| JSON.parse(request.body)["tags"] == ["default"] }
  end

  class Observer
    class << self
      attr_accessor :message_id

      def delivered_email(message)
        self.message_id = message[:helo_message_id]&.value
      end
    end
  end

  def test_observers_see_the_api_message_id
    ActionMailer::Base.register_observer(Observer)
    WelcomeMailer.plain.deliver_now

    assert_equal MESSAGE_ID, Observer.message_id
  ensure
    ActionMailer::Base.unregister_observer(Observer)
  end

  def test_deliver_now_returns_the_message_and_deliver_now_bang_the_response
    assert_kind_of Mail::Message, WelcomeMailer.plain.deliver_now
    assert_equal MESSAGE_ID, WelcomeMailer.plain.deliver_now!.message_id
  end
end

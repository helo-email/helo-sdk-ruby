# frozen_string_literal: true

require "test_helper"

class SendingTest < Minitest::Test
  def test_transactional
    request_data = { from: Helo::MailAddress.new(email: "from@yourdomain.com", name: "From name"), to: [Helo::MailAddress.new(email: "to@example.com", name: "To name")], cc: [Helo::MailAddress.new(email: "cc@example.com", name: "Cc name")], bcc: [Helo::MailAddress.new(email: "bcc@example.com", name: "Bcc name")], reply_to: [Helo::MailAddress.new(email: "reply-to@example.com", name: "Reply-To name")], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", template: {}, tracking: {}, attachments: [Helo::Attachment.new(content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT)], tags: ["welcome", "onboarding"], headers: {}, metadata: {} }

    stub_request(:post, "http://localhost:8002/send/transactional")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.transactional(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendMessageAcceptedResponse, result
  end

  def test_transactional_batch
    request_data = { requests: [Helo::SendMessageRequest.new(to: [], cc: [], bcc: [], reply_to: [], subject: "test-subject", html: "test-html", text: "test-text", template: {}, tracking: {}, attachments: [], tags: ["example1", "example2"], headers: {}, metadata: {})] }

    stub_request(:post, "http://localhost:8002/send/transactional/batch")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.transactional_batch(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendMessageBatchResponse, result
  end

  def test_broadcast
    request_data = { from: Helo::MailAddress.new(email: "test-email", name: "test-name"), reply_to: [Helo::MailAddress.new(email: "test-email", name: "test-name")], template: {}, tracking: {}, attachments: [Helo::Attachment.new(content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT)], tags: ["example1", "example2"], headers: {}, metadata: {}, messages: [] }

    stub_request(:post, "http://localhost:8002/send/broadcast")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.broadcast(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendBroadcastResponse, result
  end

  def test_broadcast_message
    request_data = { from: Helo::MailAddress.new(email: "from@yourdomain.com", name: "From name"), to: [Helo::MailAddress.new(email: "to@example.com", name: "To name")], cc: [Helo::MailAddress.new(email: "cc@example.com", name: "Cc name")], bcc: [Helo::MailAddress.new(email: "bcc@example.com", name: "Bcc name")], reply_to: [Helo::MailAddress.new(email: "reply-to@example.com", name: "Reply-To name")], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", template: {}, tracking: {}, attachments: [Helo::Attachment.new(content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT)], tags: ["welcome", "onboarding"], headers: {}, metadata: {} }

    stub_request(:post, "http://localhost:8002/send/broadcast/message")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.broadcast_message(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendMessageAcceptedResponse, result
  end
end

# frozen_string_literal: true

require "test_helper"

class SendingTest < Minitest::Test
  def test_send_transactional
    request_data = { from: { email: "from@yourdomain.com", name: "From name" }, to: [{ email: "to@example.com", name: "To name" }], cc: [{ email: "cc@example.com", name: "Cc name" }], bcc: [{ email: "bcc@example.com", name: "Bcc name" }], reply_to: [{ email: "reply-to@example.com", name: "Reply-To name" }], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", tracking: { opens: true, links: true }, attachments: [{ content: "SGVsbG8gd29ybGQ=", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }], tags: ["welcome", "onboarding"], headers: {}, metadata: {} }

    stub_request(:post, "http://localhost:8002/send/transactional")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.send_transactional(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendMessageAcceptedResponse, result
  end

  def test_send_transactional_batch
    request_data = { requests: [{ from: { email: "from@yourdomain.com", name: "From name" }, to: [{ email: "to@example.com", name: "To name" }], cc: [{ email: "cc@example.com", name: "Cc name" }], bcc: [{ email: "bcc@example.com", name: "Bcc name" }], reply_to: [{ email: "reply-to@example.com", name: "Reply-To name" }], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", tracking: { opens: true, links: true }, attachments: [{ content: "SGVsbG8gd29ybGQ=", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }], tags: ["welcome", "onboarding"], headers: {}, metadata: {} }] }

    stub_request(:post, "http://localhost:8002/send/transactional/batch")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.send_transactional_batch(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendMessageBatchResponse, result
  end

  def test_send_broadcast
    request_data = { from: { email: "test@example.com", name: "test-name" }, reply_to: [{ email: "test@example.com", name: "test-name" }], template: { subject: "Hello, {{name}}", html: "<html><body><h1>Hi {{name}}.</h1><p>This is a broadcast, delivered with <3 by Helo.</p></body></html>", text: "Hi {{name}}. This is a broadcast, delivered with <3 by Helo.", inline_styles: true, data: {} }, tracking: { opens: true, links: true }, attachments: [{ content: "SGVsbG8gd29ybGQ=", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }], tags: ["example1", "example2"], headers: {}, metadata: {}, messages: [{ to: [{ email: "test@example.com", name: "test-name" }], cc: [{ email: "test@example.com", name: "test-name" }], bcc: [{ email: "test@example.com", name: "test-name" }], tags: ["example1", "example2"], headers: {}, metadata: {}, data: {} }] }

    stub_request(:post, "http://localhost:8002/send/broadcast")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.send_broadcast(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendBroadcastResponse, result
  end

  def test_send_broadcast_message
    request_data = { from: { email: "from@yourdomain.com", name: "From name" }, to: [{ email: "to@example.com", name: "To name" }], cc: [{ email: "cc@example.com", name: "Cc name" }], bcc: [{ email: "bcc@example.com", name: "Bcc name" }], reply_to: [{ email: "reply-to@example.com", name: "Reply-To name" }], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", tracking: { opens: true, links: true }, attachments: [{ content: "SGVsbG8gd29ybGQ=", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }], tags: ["welcome", "onboarding"], headers: {}, metadata: {} }

    stub_request(:post, "http://localhost:8002/send/broadcast/message")
      .with(headers: { "Authorization" => "Bearer test-token-123", "X-Helo-Channel-Id" => "550e8400-e29b-41d4-a716-446655440000", "X-Helo-Idempotency-Key" => "example" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.send_broadcast_message(request_data, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")

    assert_instance_of Helo::SendMessageAcceptedResponse, result
  end
end

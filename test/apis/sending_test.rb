# frozen_string_literal: true

require "test_helper"

class SendingTest < Minitest::Test
  def test_transactional
    request_data = { to: [] }

    stub_request(:post, "http://localhost:8002/send/transactional")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.transactional(request_data)

    assert_instance_of Helo::SendMessageAcceptedResponse, result
  end

  def test_transactional_batch
    request_data = { requests: [] }

    stub_request(:post, "http://localhost:8002/send/transactional/batch")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.transactional_batch(request_data)

    assert_instance_of Helo::SendMessageBatchResponse, result
  end

  def test_broadcast
    request_data = { messages: [] }

    stub_request(:post, "http://localhost:8002/send/broadcast")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.broadcast(request_data)

    assert_instance_of Helo::SendBroadcastResponse, result
  end

  def test_broadcast_message
    request_data = { to: [] }

    stub_request(:post, "http://localhost:8002/send/broadcast/message")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Sending.broadcast_message(request_data)

    assert_instance_of Helo::SendMessageAcceptedResponse, result
  end
end

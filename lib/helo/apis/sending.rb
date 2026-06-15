# frozen_string_literal: true

module Helo
  class Sending < API
    def transactional(request_data, channel_id: nil, idempotency_key: nil)
      request = SendMessageRequest.new(request_data)
      headers = {}
      headers["X-Helo-Channel-Id"] = channel_id unless channel_id.nil?
      headers["X-Helo-Idempotency-Key"] = idempotency_key unless idempotency_key.nil?
      response = @client.request(:post, "/send/transactional", body: request.to_params, headers: headers)
      SendMessageAcceptedResponse.from_hash(response.body)
    end

    def transactional_batch(request_data, channel_id: nil, idempotency_key: nil)
      request = SendMessageBatchRequest.new(request_data)
      headers = {}
      headers["X-Helo-Channel-Id"] = channel_id unless channel_id.nil?
      headers["X-Helo-Idempotency-Key"] = idempotency_key unless idempotency_key.nil?
      response = @client.request(:post, "/send/transactional/batch", body: request.to_params, headers: headers)
      SendMessageBatchResponse.from_hash(response.body)
    end

    def broadcast(request_data, channel_id: nil, idempotency_key: nil)
      request = SendBroadcastRequest.new(request_data)
      headers = {}
      headers["X-Helo-Channel-Id"] = channel_id unless channel_id.nil?
      headers["X-Helo-Idempotency-Key"] = idempotency_key unless idempotency_key.nil?
      response = @client.request(:post, "/send/broadcast", body: request.to_params, headers: headers)
      SendBroadcastResponse.from_hash(response.body)
    end

    def broadcast_message(request_data, channel_id: nil, idempotency_key: nil)
      request = SendMessageRequest.new(request_data)
      headers = {}
      headers["X-Helo-Channel-Id"] = channel_id unless channel_id.nil?
      headers["X-Helo-Idempotency-Key"] = idempotency_key unless idempotency_key.nil?
      response = @client.request(:post, "/send/broadcast/message", body: request.to_params, headers: headers)
      SendMessageAcceptedResponse.from_hash(response.body)
    end

    class_methods :transactional, :transactional_batch, :broadcast, :broadcast_message
  end
end

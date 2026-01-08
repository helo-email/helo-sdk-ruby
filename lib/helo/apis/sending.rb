# frozen_string_literal: true

module Helo
  class Sending < API
    def transactional(request_data)
      request = SendMessageRequest.new(request_data)
      response = @client.request(:post, "/send/transactional", body: request.to_params)
      SendMessageAcceptedResponse.from_hash(response.body)
    end

    def transactional_batch(request_data)
      request = SendMessageBatchRequest.new(request_data)
      response = @client.request(:post, "/send/transactional/batch", body: request.to_params)
      SendMessageBatchResponse.from_hash(response.body)
    end

    def broadcast(request_data)
      request = SendBroadcastRequest.new(request_data)
      response = @client.request(:post, "/send/broadcast", body: request.to_params)
      SendBroadcastResponse.from_hash(response.body)
    end

    def broadcast_message(request_data)
      request = SendMessageRequest.new(request_data)
      response = @client.request(:post, "/send/broadcast/message", body: request.to_params)
      SendMessageAcceptedResponse.from_hash(response.body)
    end

    class_methods :transactional, :transactional_batch, :broadcast, :broadcast_message
  end
end

# frozen_string_literal: true

module Helo
  class WebhookEndpoints < API
    def list(request_data = {})
      request = WebhookEndpointsListRequest.new(request_data)
      response = @client.request(:get, "/webhook-endpoints", params: request.to_params)
      PaginationResultOfWebhookEndpointResponse.from_hash(response.body)
    end

    def create(request_data)
      request = CreateWebhookEndpointRequest.new(request_data)
      response = @client.request(:post, "/webhook-endpoints", body: request.to_params)
      WebhookEndpointResponse.from_hash(response.body)
    end

    def retrieve(id)
      response = @client.request(:get, "/webhook-endpoints/#{id}")
      WebhookEndpointResponse.from_hash(response.body)
    end

    def update(id, request_data)
      request = UpdateWebhookEndpointRequest.new(request_data)
      response = @client.request(:patch, "/webhook-endpoints/#{id}", body: request.to_params)
      WebhookEndpointResponse.from_hash(response.body)
    end

    def delete(id)
      response = @client.request(:delete, "/webhook-endpoints/#{id}")
      nil
    end

    def regenerate_signing_key(id)
      response = @client.request(:post, "/webhook-endpoints/#{id}/regenerate-signing-key")
      WebhookEndpointResponse.from_hash(response.body)
    end

    class_methods :list, :create, :retrieve, :update, :delete, :regenerate_signing_key
  end
end

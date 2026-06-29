# frozen_string_literal: true

module Helo
  class Webhooks < API
    def list_for_channel(id)
      response = @client.request(:get, "/app/channels/#{id}/webhooks")
      WebhooksResponse.from_hash(response.body)
    end

    def list(request_data = {})
      request = WebhooksListRequest.new(request_data)
      response = @client.request(:get, "/webhooks", params: request.to_params)
      PaginationResultOfWebhookResponse.from_hash(response.body)
    end

    def create(request_data)
      request = CreateWebhookRequest.new(request_data)
      response = @client.request(:post, "/webhooks", body: request.to_params)
      WebhookResponse.from_hash(response.body)
    end

    def retrieve(id)
      response = @client.request(:get, "/webhooks/#{id}")
      WebhookResponse.from_hash(response.body)
    end

    def update(id, request_data)
      request = UpdateWebhookRequest.new(request_data)
      response = @client.request(:patch, "/webhooks/#{id}", body: request.to_params)
      WebhookResponse.from_hash(response.body)
    end

    def delete(id)
      response = @client.request(:delete, "/webhooks/#{id}")
      nil
    end

    def regenerate_signing_key(id)
      response = @client.request(:post, "/webhooks/#{id}/regenerate-signing-key")
      WebhookResponse.from_hash(response.body)
    end

    class_methods :list_for_channel, :list, :create, :retrieve, :update, :delete, :regenerate_signing_key
  end
end

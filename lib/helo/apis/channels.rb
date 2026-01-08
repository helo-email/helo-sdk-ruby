# frozen_string_literal: true

module Helo
  class Channels < API
    def list(request_data = {})
      request = ChannelsListRequest.new(request_data)
      response = @client.request(:get, "/channels", params: request.to_params)
      PaginationResultOfChannelResponse.from_hash(response.body)
    end

    def create(request_data)
      request = CreateChannelRequest.new(request_data)
      response = @client.request(:post, "/channels", body: request.to_params)
      ChannelResponse.from_hash(response.body)
    end

    def retrieve(id)
      response = @client.request(:get, "/channels/#{id}")
      ChannelResponse.from_hash(response.body)
    end

    def update(id, request_data)
      request = UpdateChannelRequest.new(request_data)
      response = @client.request(:patch, "/channels/#{id}", body: request.to_params)
      ChannelResponse.from_hash(response.body)
    end

    def delete(id)
      response = @client.request(:delete, "/channels/#{id}")
      nil
    end

    class_methods :list, :create, :retrieve, :update, :delete
  end
end

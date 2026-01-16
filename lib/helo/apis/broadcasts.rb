# frozen_string_literal: true

module Helo
  class Broadcasts < API
    def list(request_data = {})
      request = BroadcastsListRequest.new(request_data)
      response = @client.request(:get, "/broadcasts", params: request.to_params)
      PaginatedResponseOfBroadcastResponse.from_hash(response.body)
    end

    def retrieve(id)
      response = @client.request(:get, "/broadcasts/#{id}")
      BroadcastDetailsResponse.from_hash(response.body)
    end

    def list_failures(id)
      response = @client.request(:get, "/broadcasts/#{id}/failures")
      BroadcastFailuresResponse.from_hash(response.body)
    end

    def list_suppressions(id)
      response = @client.request(:get, "/broadcasts/#{id}/suppressions")
      BroadcastSuppressionsResponse.from_hash(response.body)
    end

    class_methods :list, :retrieve, :list_failures, :list_suppressions
  end
end

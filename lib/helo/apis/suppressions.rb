# frozen_string_literal: true

module Helo
  class Suppressions < API
    def list(request_data = {})
      request = SuppressionsListRequest.new(request_data)
      response = @client.request(:get, "/suppressions", params: request.to_params)
      PaginatedResponseOfSuppressionResponse.from_hash(response.body)
    end

    def create(request_data)
      request = CreateSuppressionsRequest.new(request_data)
      response = @client.request(:post, "/suppressions", body: request.to_params)
      CreateSuppressionsResponse.from_hash(response.body)
    end

    def remove(request_data)
      request = RemoveSuppressionsRequest.new(request_data)
      response = @client.request(:post, "/suppressions/remove", body: request.to_params)
      RemoveSuppressionsResponse.from_hash(response.body)
    end

    class_methods :list, :create, :remove
  end
end

# frozen_string_literal: true

module Helo
  class Domains < API
    def list(request_data = {})
      request = DomainsListRequest.new(request_data)
      response = @client.request(:get, "/domains", params: request.to_params)
      PaginatedResponseOfDomainResponse.from_hash(response.body)
    end

    def create(request_data)
      request = CreateDomainRequest.new(request_data)
      response = @client.request(:post, "/domains", body: request.to_params)
      DomainWithDnsResponse.from_hash(response.body)
    end

    def retrieve(id)
      response = @client.request(:get, "/domains/#{id}")
      DomainWithDnsResponse.from_hash(response.body)
    end

    def update(id, request_data)
      request = UpdateDomainRequest.new(request_data)
      response = @client.request(:patch, "/domains/#{id}", body: request.to_params)
      DomainResponse.from_hash(response.body)
    end

    def delete(id)
      response = @client.request(:delete, "/domains/#{id}")
      nil
    end

    def verify(id)
      response = @client.request(:post, "/domains/#{id}/verify")
      DnsRecordsResponse.from_hash(response.body)
    end

    def rotate_key(id)
      response = @client.request(:post, "/domains/#{id}/rotate-key")
      DnsRecordResponse.from_hash(response.body)
    end

    class_methods :list, :create, :retrieve, :update, :delete, :verify, :rotate_key
  end
end

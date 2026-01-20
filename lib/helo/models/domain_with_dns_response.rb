# frozen_string_literal: true

module Helo
  class DomainWithDnsResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :name, :string, key: "name"
    api_attribute :verified, :boolean, key: "verified"
    api_attribute :channels, Helo::Core::ArrayType.new("Helo::DomainChannelResponse"), key: "channels"
    api_attribute :dns_records, Helo::Core::ModelType.new("Helo::DnsRecordsResponse"), key: "dnsRecords"
  end
end

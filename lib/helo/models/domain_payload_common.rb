# frozen_string_literal: true

module Helo
  class DomainPayloadCommon
    include Helo::Core::Model

    api_attribute :domain_id, :string, key: "domainId"
    api_attribute :domain_name, :string, key: "domainName"
    api_attribute :dns_record_host, :string, key: "dnsRecordHost"
    api_attribute :timestamp, :datetime, key: "timestamp"
  end
end

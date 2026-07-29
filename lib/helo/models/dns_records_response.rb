# frozen_string_literal: true

module Helo
  class DnsRecordsResponse
    include Helo::Core::Model

    api_attribute :domain_key_active, Helo::Core::ModelType.new("Helo::DnsRecordResponse"), key: "domainKeyActive"
    api_attribute :domain_key_pending, Helo::Core::ModelType.new("Helo::DnsRecordResponse"), key: "domainKeyPending"
    api_attribute :return_path, Helo::Core::ArrayType.new("Helo::DnsRecordResponse"), key: "returnPath"
  end
end

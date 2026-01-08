# frozen_string_literal: true

module Helo
  class DnsRecordResponse
    include Helo::Core::Model

    api_attribute :type, :string, key: "type"
    api_attribute :host, :string, key: "host"
    api_attribute :value, :string, key: "value"
    api_attribute :status, :string, key: "status"
  end
end

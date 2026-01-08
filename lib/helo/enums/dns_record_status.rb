# frozen_string_literal: true

module Helo
  class DnsRecordStatus
    PENDING = "pending"
    VERIFIED = "verified"
    FAILING = "failing"
    FAILED = "failed"

    def self.all
      [PENDING, VERIFIED, FAILING, FAILED].freeze
    end
  end
end

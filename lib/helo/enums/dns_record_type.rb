# frozen_string_literal: true

module Helo
  class DnsRecordType
    TXT = "txt"
    CNAME = "cname"

    def self.all
      [TXT, CNAME].freeze
    end
  end
end

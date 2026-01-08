# frozen_string_literal: true

module Helo
  class MailType
    TRANSACTIONAL = "transactional"
    BROADCAST = "broadcast"

    def self.all
      [TRANSACTIONAL, BROADCAST].freeze
    end
  end
end

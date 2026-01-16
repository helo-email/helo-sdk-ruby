# frozen_string_literal: true

module Helo
  class DeliveryType
    LIVE = "live"
    SANDBOX = "sandbox"

    def self.all
      [LIVE, SANDBOX].freeze
    end
  end
end

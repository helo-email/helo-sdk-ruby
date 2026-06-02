# frozen_string_literal: true

module Helo
  class DeliveryType1
    LIVE = "live"
    SANDBOX = "sandbox"

    def self.all
      [LIVE, SANDBOX].freeze
    end
  end
end

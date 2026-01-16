# frozen_string_literal: true

module Helo
  class SuppressionReason
    BOUNCE = "bounce"
    COMPLAINT = "complaint"
    UNSUBSCRIBE = "unsubscribe"
    MANUAL = "manual"

    def self.all
      [BOUNCE, COMPLAINT, UNSUBSCRIBE, MANUAL].freeze
    end
  end
end

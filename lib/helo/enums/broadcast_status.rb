# frozen_string_literal: true

module Helo
  class BroadcastStatus
    ACCEPTED = "accepted"
    PROCESSING = "processing"
    COMPLETED = "completed"
    CANCELLED = "cancelled"

    def self.all
      [ACCEPTED, PROCESSING, COMPLETED, CANCELLED].freeze
    end
  end
end

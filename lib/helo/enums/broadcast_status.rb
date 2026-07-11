# frozen_string_literal: true

module Helo
  class BroadcastStatus
    ACCEPTED = "accepted"
    PROCESSING = "processing"
    COMPLETED = "completed"
    CANCELED = "canceled"

    def self.all
      [ACCEPTED, PROCESSING, COMPLETED, CANCELED].freeze
    end
  end
end

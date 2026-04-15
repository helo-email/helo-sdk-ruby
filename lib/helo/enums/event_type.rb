# frozen_string_literal: true

module Helo
  class EventType
    ACCEPTED = "accepted"
    PROCESSED = "processed"
    DELIVERED = "delivered"
    BOUNCED = "bounced"
    OPENED = "opened"
    CLICKED = "clicked"
    COMPLAINED = "complained"
    UNSUBSCRIBED = "unsubscribed"
    RESUBSCRIBED = "resubscribed"

    def self.all
      [ACCEPTED, PROCESSED, DELIVERED, BOUNCED, OPENED, CLICKED, COMPLAINED, UNSUBSCRIBED, RESUBSCRIBED].freeze
    end
  end
end

# frozen_string_literal: true

module Helo
  class WebhookEvent
    ACCEPTED = "accepted"
    PROCESSED = "processed"
    BOUNCED = "bounced"
    DELIVERED = "delivered"
    OPENED = "opened"
    CLICKED = "clicked"
    COMPLAINED = "complained"
    UNSUBSCRIBED = "unsubscribed"
    RESUBSCRIBED = "resubscribed"

    def self.all
      [ACCEPTED, PROCESSED, BOUNCED, DELIVERED, OPENED, CLICKED, COMPLAINED, UNSUBSCRIBED, RESUBSCRIBED].freeze
    end
  end
end

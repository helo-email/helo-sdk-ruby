# frozen_string_literal: true

module Helo
  class WebhookEvent
    ACCEPTED = "accepted"
    PROCESSED = "processed"
    CLICKED = "clicked"
    OPENED = "opened"

    def self.all
      [ACCEPTED, PROCESSED, CLICKED, OPENED].freeze
    end
  end
end

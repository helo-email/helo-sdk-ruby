# frozen_string_literal: true

module Helo
  class MessageStatus
    QUEUED = "queued"
    SENT = "sent"

    def self.all
      [QUEUED, SENT].freeze
    end
  end
end

# frozen_string_literal: true

module Helo
  class MessageDetailsResponseEvent
    include Helo::Core::Model

    api_attribute :event_type, :string, key: "eventType"
    api_attribute :timestamp, :datetime, key: "timestamp"
    api_attribute :recipients, key: "recipients"
    api_attribute :details, key: "details"
  end
end

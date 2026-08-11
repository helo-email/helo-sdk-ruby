# frozen_string_literal: true

module Helo
  class MessageStatistics
    include Helo::Core::Model

    api_attribute :delivered, :integer, key: "delivered"
    api_attribute :bounced, :integer, key: "bounced"
    api_attribute :opened, :integer, key: "opened"
    api_attribute :clicked, :integer, key: "clicked"
    api_attribute :complained, :integer, key: "complained"
    api_attribute :unsubscribed, :integer, key: "unsubscribed"
  end
end

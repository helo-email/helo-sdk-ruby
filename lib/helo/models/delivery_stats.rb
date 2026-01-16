# frozen_string_literal: true

module Helo
  class DeliveryStats
    include Helo::Core::Model

    api_attribute :sent, :integer, key: "sent"
    api_attribute :delivered, :integer, key: "delivered"
    api_attribute :opened, :integer, key: "opened"
    api_attribute :clicked, :integer, key: "clicked"
    api_attribute :bounced, :integer, key: "bounced"
    api_attribute :unsubscribed, :integer, key: "unsubscribed"
    api_attribute :complained, :integer, key: "complained"
  end
end

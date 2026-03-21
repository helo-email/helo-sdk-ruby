# frozen_string_literal: true

module Helo
  class UpdateChannelRequest
    include Helo::Core::Model

    api_attribute :name, :string, key: "name"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :tracking, Helo::Core::ModelType.new("Helo::UpdateChannelTracking"), key: "tracking"
  end
end

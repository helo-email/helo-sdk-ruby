# frozen_string_literal: true

module Helo
  class ChannelDetailsResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :name, :string, key: "name"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :updated_at, :datetime, key: "updatedAt"
    api_attribute :tracking, Helo::Core::ModelType.new("Helo::ChannelTracking"), key: "tracking"
  end
end

# frozen_string_literal: true

module Helo
  class ChannelResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :name, :string, key: "name"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :track_links, :boolean, key: "trackLinks"
    api_attribute :track_opens, :boolean, key: "trackOpens"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :updated_at, :datetime, key: "updatedAt"
  end
end

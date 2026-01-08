# frozen_string_literal: true

module Helo
  class CreateChannelRequest
    include Helo::Core::Model

    api_attribute :name, :string, key: "name"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :track_links, :boolean, key: "trackLinks"
    api_attribute :track_opens, :boolean, key: "trackOpens"
  end
end

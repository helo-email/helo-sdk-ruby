# frozen_string_literal: true

module Helo
  class ClickedDetails
    include Helo::Core::Model

    api_attribute :link, :string, key: "link"
    api_attribute :ip, :string, key: "ip"
    api_attribute :country, :string, key: "country"
    api_attribute :country_code, :string, key: "countryCode"
    api_attribute :client, Helo::Core::ModelType.new("Helo::ClientDetails"), key: "client"
    api_attribute :device, Helo::Core::ModelType.new("Helo::DeviceDetails"), key: "device"
  end
end

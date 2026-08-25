# frozen_string_literal: true

module Helo
  class DeviceDetails
    include Helo::Core::Model

    api_attribute :brand, :string, key: "brand"
    api_attribute :family, :string, key: "family"
    api_attribute :model, :string, key: "model"
  end
end

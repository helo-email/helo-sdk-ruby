# frozen_string_literal: true

module Helo
  class DomainChannelResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :name, :string, key: "name"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :deleted, :boolean, key: "deleted"
  end
end

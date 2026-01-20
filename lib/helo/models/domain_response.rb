# frozen_string_literal: true

module Helo
  class DomainResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :name, :string, key: "name"
    api_attribute :verified, :boolean, key: "verified"
    api_attribute :channels, Helo::Core::ArrayType.new("Helo::DomainChannelResponse"), key: "channels"
  end
end

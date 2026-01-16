# frozen_string_literal: true

module Helo
  class WebhookHeader
    include Helo::Core::Model

    api_attribute :name, :string, key: "name"
    api_attribute :value, :string, key: "value"
  end
end

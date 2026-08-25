# frozen_string_literal: true

module Helo
  class DeliveredDetails
    include Helo::Core::Model

    api_attribute :response, :string, key: "response"
  end
end

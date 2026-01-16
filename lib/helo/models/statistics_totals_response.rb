# frozen_string_literal: true

module Helo
  class StatisticsTotalsResponse
    include Helo::Core::Model

    api_attribute :transactional, Helo::Core::ModelType.new("Helo::DeliveryStats"), key: "transactional"
    api_attribute :broadcast, Helo::Core::ModelType.new("Helo::DeliveryStats"), key: "broadcast"
  end
end

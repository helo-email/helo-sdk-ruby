# frozen_string_literal: true

module Helo
  class StatisticsHourlyResponseResult
    include Helo::Core::Model

    api_attribute :timestamp, :datetime, key: "timestamp"
    api_attribute :transactional, Helo::Core::ModelType.new("Helo::DeliveryStats"), key: "transactional"
    api_attribute :broadcast, Helo::Core::ModelType.new("Helo::DeliveryStats"), key: "broadcast"
  end
end

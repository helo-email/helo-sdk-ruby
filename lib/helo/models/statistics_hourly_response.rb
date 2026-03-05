# frozen_string_literal: true

module Helo
  class StatisticsHourlyResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::StatisticsHourlyResponseResult"), key: "results"
  end
end

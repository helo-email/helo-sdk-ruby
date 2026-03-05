# frozen_string_literal: true

module Helo
  class StatisticsDailyResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::StatisticsDailyResponseResult"), key: "results"
  end
end

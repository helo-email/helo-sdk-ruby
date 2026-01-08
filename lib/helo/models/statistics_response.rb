# frozen_string_literal: true

module Helo
  class StatisticsResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::StatisticsResponseResult"), key: "results"
  end
end

# frozen_string_literal: true

module Helo
  class CreateSuppressionsResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::SuppressionResult"), key: "results"
  end
end

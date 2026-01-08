# frozen_string_literal: true

module Helo
  class RemoveSuppressionsResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::RemoveSuppressionResult"), key: "results"
  end
end

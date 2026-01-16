# frozen_string_literal: true

module Helo
  class BroadcastFailuresResponse
    include Helo::Core::Model

    api_attribute :failures, Helo::Core::ArrayType.new("Helo::BroadcastFailure"), key: "failures"
  end
end

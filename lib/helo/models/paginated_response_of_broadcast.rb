# frozen_string_literal: true

module Helo
  class PaginatedResponseOfBroadcast
    include Helo::Core::Model

    api_attribute :total_count, :integer, key: "totalCount"
    api_attribute :results, Helo::Core::ArrayType.new("Helo::BroadcastResponse"), key: "results"
  end
end

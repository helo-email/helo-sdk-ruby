# frozen_string_literal: true

module Helo
  class PaginatedEventsResponse
    include Helo::Core::Model

    api_attribute :after, :integer, key: "after"
    api_attribute :total_count, :float, key: "totalCount"
    api_attribute :results, Helo::Core::ArrayType.new("Helo::ActivityEvent"), key: "results"
  end
end

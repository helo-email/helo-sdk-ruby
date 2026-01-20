# frozen_string_literal: true

module Helo
  class PaginatedResponseOfBroadcastSuppression
    include Helo::Core::Model

    api_attribute :total_count, :integer, key: "totalCount"
    api_attribute :results, key: "results"
  end
end

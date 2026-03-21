# frozen_string_literal: true

module Helo
  class PaginationResultOfChannelBasicResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::ChannelBasicResponse"), key: "results"
    api_attribute :total_count, :integer, key: "totalCount"
  end
end

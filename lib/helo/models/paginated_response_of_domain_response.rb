# frozen_string_literal: true

module Helo
  class PaginatedResponseOfDomainResponse
    include Helo::Core::Model

    api_attribute :total_count, :integer, key: "totalCount"
    api_attribute :results, Helo::Core::ArrayType.new("Helo::DomainResponse"), key: "results"
  end
end

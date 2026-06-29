# frozen_string_literal: true

module Helo
  class PaginationResultOfWebhookResponse
    include Helo::Core::Model

    api_attribute :results, Helo::Core::ArrayType.new("Helo::WebhookResponse"), key: "results"
    api_attribute :total_count, :integer, key: "totalCount"
  end
end

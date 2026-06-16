# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class BroadcastsListFailuresRequest
    include Helo::Core::Model

    api_attribute :limit, :integer, key: "limit"
    api_attribute :offset, :integer, key: "offset"
  end
end

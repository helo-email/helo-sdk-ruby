# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class DomainsListRequest
    include Helo::Core::Model

    api_attribute :limit, :integer, key: "limit"
    api_attribute :offset, :integer, key: "offset"
    api_attribute :name, :string, key: "name"
    api_attribute :channel_ids, key: "channelIds", explode: false
  end
end

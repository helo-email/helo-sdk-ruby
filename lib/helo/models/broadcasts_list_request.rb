# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class BroadcastsListRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :status, :string, key: "status"
    api_attribute :subject, :string, key: "subject"
    api_attribute :from, :datetime, key: "from"
    api_attribute :to, :datetime, key: "to"
    api_attribute :limit, :integer, key: "limit"
    api_attribute :offset, :integer, key: "offset"
  end
end

# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class StatisticsRetrieveHourlyRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :from, :datetime, key: "from"
    api_attribute :to, :datetime, key: "to"
    api_attribute :tags, key: "tags"
  end
end

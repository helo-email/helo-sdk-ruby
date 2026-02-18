# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class StatisticsRetrieveDailyRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :from, :date, key: "from"
    api_attribute :to, :date, key: "to"
    api_attribute :tag, :string, key: "tag"
    api_attribute :timezone, :string, key: "timezone"
  end
end

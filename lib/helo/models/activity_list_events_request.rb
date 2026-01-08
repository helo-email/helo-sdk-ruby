# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class ActivityListEventsRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :message_id, :string, key: "messageId"
    api_attribute :after, :integer, key: "after"
    api_attribute :start_date, :datetime, key: "startDate"
    api_attribute :end_date, :datetime, key: "endDate"
    api_attribute :limit, :integer, key: "limit"
  end
end

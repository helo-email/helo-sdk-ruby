# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class ActivityListMessagesRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :after, :integer, key: "after"
    api_attribute :start_date, :datetime, key: "startDate"
    api_attribute :end_date, :datetime, key: "endDate"
    api_attribute :limit, :integer, key: "limit"
    api_attribute :recipient, :string, key: "recipient"
    api_attribute :subject, :string, key: "subject"
    api_attribute :tags, key: "tags"
    api_attribute :mail_type, :string, key: "mailType"
    api_attribute :status, :string, key: "status"
  end
end

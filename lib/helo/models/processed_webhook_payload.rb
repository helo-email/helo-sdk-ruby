# frozen_string_literal: true

module Helo
  class ProcessedWebhookPayload
    include Helo::Core::Model

    api_attribute :event_type, :string, key: "eventType"
    api_attribute :recipients, key: "recipients"
    api_attribute :message_id, :string, key: "messageId"
    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :mail_type, :string, key: "mailType"
    api_attribute :subject, :string, key: "subject"
    api_attribute :tags, key: "tags"
    api_attribute :metadata, key: "metadata"
    api_attribute :timestamp, :datetime, key: "timestamp"
  end
end

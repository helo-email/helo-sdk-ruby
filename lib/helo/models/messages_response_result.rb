# frozen_string_literal: true

module Helo
  class MessagesResponseResult
    include Helo::Core::Model

    api_attribute :message_id, :string, key: "messageId"
    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :timestamp, :datetime, key: "timestamp"
    api_attribute :mail_type, :string, key: "mailType"
    api_attribute :mail_source, :string, key: "mailSource"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :status, :string, key: "status"
    api_attribute :recipients, key: "recipients"
  end
end

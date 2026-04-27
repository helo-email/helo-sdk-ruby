# frozen_string_literal: true

module Helo
  class MessageDetailsResponse
    include Helo::Core::Model

    api_attribute :message_id, :string, key: "messageId"
    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :timestamp, :datetime, key: "timestamp"
    api_attribute :mail_type, :string, key: "mailType"
    api_attribute :mail_source, :string, key: "mailSource"
    api_attribute :delivery_type, :string, key: "deliveryType"
    api_attribute :status, :string, key: "status"
    api_attribute :subject, :string, key: "subject"
    api_attribute :from, Helo::Core::ModelType.new("Helo::MailAddress"), key: "from"
    api_attribute :to, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "to"
    api_attribute :cc, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "cc"
    api_attribute :bcc, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "bcc"
    api_attribute :reply_to, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "replyTo"
    api_attribute :text, :string, key: "text"
    api_attribute :html, :string, key: "html"
    api_attribute :body, :string, key: "body"
    api_attribute :tags, key: "tags"
    api_attribute :headers, key: "headers"
    api_attribute :metadata, key: "metadata"
    api_attribute :attachments, Helo::Core::ArrayType.new("Helo::MessageDetailsResponseAttachment"), key: "attachments"
    api_attribute :tracking, Helo::Core::ModelType.new("Helo::MessageDetailsResponseTracking"), key: "tracking"
    api_attribute :events, Helo::Core::ArrayType.new("Helo::MessageDetailsResponseEvent"), key: "events"
  end
end

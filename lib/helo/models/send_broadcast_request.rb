# frozen_string_literal: true

module Helo
  class SendBroadcastRequest
    include Helo::Core::Model

    api_attribute :from, Helo::Core::ModelType.new("Helo::MailAddress"), key: "from"
    api_attribute :reply_to, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "replyTo"
    api_attribute :template, Helo::Core::ModelType.new("Helo::SendBroadcastRequestTemplate"), key: "template"
    api_attribute :tracking, Helo::Core::ModelType.new("Helo::SendBroadcastRequestTracking"), key: "tracking"
    api_attribute :attachments, Helo::Core::ArrayType.new("Helo::Attachment"), key: "attachments"
    api_attribute :tags, key: "tags"
    api_attribute :headers, key: "headers"
    api_attribute :metadata, key: "metadata"
    api_attribute :messages, Helo::Core::ArrayType.new("Helo::SendBroadcastRequestMessage"), key: "messages"
  end
end

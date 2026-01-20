# frozen_string_literal: true

module Helo
  class BroadcastContent
    include Helo::Core::Model

    api_attribute :from, Helo::Core::ModelType.new("Helo::MailAddress1"), key: "from"
    api_attribute :reply_to, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "replyTo"
    api_attribute :template, Helo::Core::ModelType.new("Helo::BroadcastContentTemplate"), key: "template"
    api_attribute :attachments, Helo::Core::ArrayType.new("Helo::BroadcastContentAttachment"), key: "attachments"
    api_attribute :tags, key: "tags"
    api_attribute :headers, key: "headers"
    api_attribute :metadata, key: "metadata"
  end
end

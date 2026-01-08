# frozen_string_literal: true

module Helo
  class SendMessageRequest
    include Helo::Core::Model

    api_attribute :from, Helo::Core::ModelType.new("Helo::MailAddress1"), key: "from"
    api_attribute :to, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "to"
    api_attribute :cc, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "cc"
    api_attribute :bcc, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "bcc"
    api_attribute :reply_to, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "replyTo"
    api_attribute :subject, :string, key: "subject"
    api_attribute :html, :string, key: "html"
    api_attribute :text, :string, key: "text"
    api_attribute :template, Helo::Core::ModelType.new("Helo::SendMessageRequestTemplate"), key: "template"
    api_attribute :tracking, Helo::Core::ModelType.new("Helo::SendMessageRequestTracking"), key: "tracking"
    api_attribute :attachments, Helo::Core::ArrayType.new("Helo::SendMessageRequestAttachment"), key: "attachments"
    api_attribute :tags, key: "tags"
    api_attribute :headers, key: "headers"
    api_attribute :metadata, key: "metadata"
  end
end

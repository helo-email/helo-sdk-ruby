# frozen_string_literal: true

module Helo
  class SendBroadcastRequestMessage
    include Helo::Core::Model

    api_attribute :to, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "to"
    api_attribute :cc, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "cc"
    api_attribute :bcc, Helo::Core::ArrayType.new("Helo::MailAddress"), key: "bcc"
    api_attribute :tags, key: "tags"
    api_attribute :headers, key: "headers"
    api_attribute :metadata, key: "metadata"
    api_attribute :data, key: "data"
  end
end

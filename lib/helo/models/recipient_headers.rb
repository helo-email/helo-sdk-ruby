# frozen_string_literal: true

module Helo
  class RecipientHeaders
    include Helo::Core::Model

    api_attribute :to, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "to"
    api_attribute :cc, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "cc"
    api_attribute :bcc, Helo::Core::ArrayType.new("Helo::MailAddress1"), key: "bcc"
  end
end

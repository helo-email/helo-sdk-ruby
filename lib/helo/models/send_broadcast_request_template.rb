# frozen_string_literal: true

module Helo
  class SendBroadcastRequestTemplate
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :subject, :string, key: "subject"
    api_attribute :html, :string, key: "html"
    api_attribute :text, :string, key: "text"
    api_attribute :inline_styles, :boolean, key: "inlineStyles"
    api_attribute :data, key: "data"
  end
end

# frozen_string_literal: true

module Helo
  class UpdateTemplateRequest
    include Helo::Core::Model

    api_attribute :name, :string, key: "name"
    api_attribute :subject, :string, key: "subject"
    api_attribute :html, :string, key: "html", nullable: true
    api_attribute :mjml, :string, key: "mjml", nullable: true
    api_attribute :text, :string, key: "text", nullable: true
    api_attribute :channel_ids, key: "channelIds", nullable: true
    api_attribute :version, :integer, key: "version"
  end
end

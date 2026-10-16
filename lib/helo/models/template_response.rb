# frozen_string_literal: true

module Helo
  class TemplateResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :updated_at, :datetime, key: "updatedAt"
    api_attribute :version, :integer, key: "version"
    api_attribute :name, :string, key: "name"
    api_attribute :subject, :string, key: "subject"
    api_attribute :html, :string, key: "html"
    api_attribute :mjml, :string, key: "mjml"
    api_attribute :text, :string, key: "text"
    api_attribute :channel_ids, key: "channelIds"
  end
end

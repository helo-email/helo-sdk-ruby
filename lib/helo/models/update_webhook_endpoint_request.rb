# frozen_string_literal: true

module Helo
  class UpdateWebhookEndpointRequest
    include Helo::Core::Model

    api_attribute :url, :string, key: "url"
    api_attribute :events, key: "events"
    api_attribute :channel_id, :string, key: "channelId", nullable: true
    api_attribute :additional_headers, Helo::Core::ArrayType.new("Helo::WebhookHeader"), key: "additionalHeaders", nullable: true
    api_attribute :enabled, :boolean, key: "enabled"
  end
end

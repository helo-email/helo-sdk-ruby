# frozen_string_literal: true

module Helo
  class WebhookEndpointResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :channel_id, :string, key: "channelId", nullable: true
    api_attribute :url, :string, key: "url"
    api_attribute :payload_signing_key, :string, key: "payloadSigningKey"
    api_attribute :enabled, :boolean, key: "enabled"
    api_attribute :additional_headers, Helo::Core::ArrayType.new("Helo::WebhookHeader"), key: "additionalHeaders"
    api_attribute :events, key: "events"
    api_attribute :last_response, Helo::Core::ModelType.new("Helo::WebhookEndpointLastResponse"), key: "lastResponse", nullable: true
  end
end

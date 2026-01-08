# frozen_string_literal: true

module Helo
  class CreateWebhookEndpointRequest
    include Helo::Core::Model

    api_attribute :url, :string, key: "url"
    api_attribute :events, key: "events"
    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :additional_headers, Helo::Core::ArrayType.new("Helo::WebhookHeader"), key: "additionalHeaders"
    api_attribute :enabled, :boolean, key: "enabled"
  end
end

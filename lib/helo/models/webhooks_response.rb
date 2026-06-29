# frozen_string_literal: true

module Helo
  class WebhooksResponse
    include Helo::Core::Model

    api_attribute :webhooks, Helo::Core::ArrayType.new("Helo::WebhookResponse"), key: "webhooks"
  end
end

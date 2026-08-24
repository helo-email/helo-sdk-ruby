# frozen_string_literal: true

module Helo
  class WebhookPayloadCommon
    include Helo::Core::Model

    api_attribute :timestamp, :datetime, key: "timestamp"
  end
end

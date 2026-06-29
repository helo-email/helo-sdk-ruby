# frozen_string_literal: true

module Helo
  class WebhookLastResponse
    include Helo::Core::Model

    api_attribute :status_code, :integer, key: "statusCode", nullable: true
    api_attribute :error, :string, key: "error", nullable: true
    api_attribute :at, :datetime, key: "at"
  end
end

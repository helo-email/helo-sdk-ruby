# frozen_string_literal: true

module Helo
  class BroadcastFailureResponse
    include Helo::Core::Model

    api_attribute :recipients, Helo::Core::ModelType.new("Helo::RecipientHeaders"), key: "recipients"
    api_attribute :message_index, :integer, key: "messageIndex"
    api_attribute :error_code, :string, key: "errorCode"
    api_attribute :error_message, :string, key: "errorMessage"
  end
end

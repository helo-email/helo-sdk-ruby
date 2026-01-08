# frozen_string_literal: true

module Helo
  class SendMessageFailedResponse
    include Helo::Core::Model

    api_attribute :status, :string, key: "status"
    api_attribute :error_code, :string, key: "errorCode"
    api_attribute :error_message, :string, key: "errorMessage"
  end
end

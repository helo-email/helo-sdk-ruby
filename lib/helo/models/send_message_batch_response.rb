# frozen_string_literal: true

module Helo
  class SendMessageBatchResponse
    include Helo::Core::Model

    api_attribute :responses, Helo::Core::ArrayType.new("Helo::SendMessageResponse"), key: "responses"
  end
end

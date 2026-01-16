# frozen_string_literal: true

module Helo
  class SendMessageBatchRequest
    include Helo::Core::Model

    api_attribute :requests, Helo::Core::ArrayType.new("Helo::SendMessageRequest"), key: "requests"
  end
end

# frozen_string_literal: true

module Helo
  class SendMessageAcceptedResponse
    include Helo::Core::Model

    api_attribute :status, :string, key: "status"
    api_attribute :message_id, :string, key: "messageId"
    api_attribute :suppressions, key: "suppressions"
  end
end

# frozen_string_literal: true

module Helo
  class SendBroadcastResponse
    include Helo::Core::Model

    api_attribute :status, :string, key: "status"
    api_attribute :broadcast_id, :string, key: "broadcastId"
  end
end

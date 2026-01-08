# frozen_string_literal: true

module Helo
  class RemoveSuppressionsRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :mail_type, :string, key: "mailType"
    api_attribute :emails, key: "emails"
  end
end

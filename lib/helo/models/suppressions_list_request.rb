# frozen_string_literal: true

module Helo
  # Generated request model for query parameters
  class SuppressionsListRequest
    include Helo::Core::Model

    api_attribute :channel_id, :string, key: "channelId"
    api_attribute :mail_type, :string, key: "mailType"
    api_attribute :reason, :string, key: "reason"
    api_attribute :email, :string, key: "email"
    api_attribute :limit, :integer, key: "limit"
    api_attribute :offset, :integer, key: "offset"
  end
end

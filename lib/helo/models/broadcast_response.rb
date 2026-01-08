# frozen_string_literal: true

module Helo
  class BroadcastResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :status, :string, key: "status"
    api_attribute :subject, :string, key: "subject"
    api_attribute :completion, :string, key: "completion"
    api_attribute :messages, :integer, key: "messages"
  end
end

# frozen_string_literal: true

module Helo
  class BroadcastDetailsResponse
    include Helo::Core::Model

    api_attribute :id, :string, key: "id"
    api_attribute :created_at, :datetime, key: "createdAt"
    api_attribute :status, :string, key: "status"
    api_attribute :subject, :string, key: "subject"
    api_attribute :completion, :string, key: "completion"
    api_attribute :messages, :integer, key: "messages"
    api_attribute :failed, :integer, key: "failed"
    api_attribute :suppressed, :integer, key: "suppressed"
    api_attribute :content, Helo::Core::ModelType.new("Helo::BroadcastContent"), key: "content"
    api_attribute :tracking, Helo::Core::ModelType.new("Helo::BroadcastTracking"), key: "tracking"
    api_attribute :statistics, Helo::Core::ModelType.new("Helo::BroadcastStatistics"), key: "statistics"
  end
end

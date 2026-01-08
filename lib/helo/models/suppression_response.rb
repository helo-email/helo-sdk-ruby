# frozen_string_literal: true

module Helo
  class SuppressionResponse
    include Helo::Core::Model

    api_attribute :email, :string, key: "email"
    api_attribute :reason, :string, key: "reason"
    api_attribute :created_at, :datetime, key: "createdAt"
  end
end

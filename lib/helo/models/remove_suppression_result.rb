# frozen_string_literal: true

module Helo
  class RemoveSuppressionResult
    include Helo::Core::Model

    api_attribute :email, :string, key: "email"
    api_attribute :success, :boolean, key: "success"
    api_attribute :message, :string, key: "message"
  end
end

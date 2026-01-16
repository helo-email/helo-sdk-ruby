# frozen_string_literal: true

module Helo
  class ErrorResponse
    include Helo::Core::Model

    api_attribute :type, :string, key: "type"
    api_attribute :title, :string, key: "title"
    api_attribute :instance, :string, key: "instance"
    api_attribute :status, :integer, key: "status"
    api_attribute :code, :string, key: "code"
    api_attribute :detail, :string, key: "detail"
    api_attribute :request_id, :string, key: "requestId"
    api_attribute :errors, key: "errors"
  end
end

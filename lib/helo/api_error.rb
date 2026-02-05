# frozen_string_literal: true

require "json"

module Helo
  class APIError < Helo::Core::APIError
    def detail
      json_response.fetch(:detail, ["API Error", code, @message].compact.join(" - "))
    end

    def errors
      json_response
        .fetch(:errors, {})
        .transform_keys(&:to_s)
    end

    private

    def json_response
      @_json_response ||= response_body.try(:deep_symbolize_keys) || {}
    end
  end
end

# frozen_string_literal: true

require "json"

module Helo
  class APIError < StandardError
    attr_reader :code, :response_body, :response_headers

    def initialize(message = nil, code: nil, response_body: nil, response_headers: nil)
      @message = message
      @code = code
      @response_body = response_body
      @response_headers = response_headers
      super(message)
    end

    def detail
      json_response.fetch(:detail, ["API Error", code, @message].compact.join(" - "))
    end

    def errors
      json_response
        .fetch(:errors, {})
        .transform_keys(&:to_s)
    end

    def message
      msg = @message
      msg += "\nHTTP status code: #{code}" if code
      msg += "\nResponse headers: #{response_headers}" if response_headers
      msg += "\nResponse body: #{response_body}" if response_body
      msg
    end

    private

    def json_response
      @_json_response ||= response_body.deep_symbolize_keys
    end
  end
end

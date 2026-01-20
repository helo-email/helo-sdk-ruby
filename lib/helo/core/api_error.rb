# frozen_string_literal: true

module Helo::Core
  class APIError < StandardError
    attr_reader :code, :response_body, :response_headers

    def initialize(message = nil, code: nil, response_body: nil, response_headers: nil)
      @message = message
      @code = code
      @response_body = response_body
      @response_headers = response_headers
      super(message)
    end

    def message
      msg = @message
      msg += "\nHTTP status code: #{code}" if code
      msg += "\nResponse headers: #{response_headers}" if response_headers
      msg += "\nResponse body: #{response_body}" if response_body
      msg
    end
  end
end

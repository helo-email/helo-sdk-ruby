# frozen_string_literal: true

module Helo
  class Client < Helo::Core::Client
    private

    def handle_error_response(response)
      raise APIError.new(
        "Request failed",
        code: response.status,
        response_body: response.body,
        response_headers: response.headers
      )
    end

    def handle_connection_error(exception)
      raise APIError.new("Connection failed: #{exception.message}")
    end
  end
end

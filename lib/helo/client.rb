# frozen_string_literal: true

module Helo
  class Client < Helo::Core::Client
    private

    def handle_error(response)
      raise APIError.new(
        "Request failed",
        code: response.status,
        response_body: response.body,
        response_headers: response.headers
      )
    end
  end
end

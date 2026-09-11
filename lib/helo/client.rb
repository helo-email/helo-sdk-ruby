# frozen_string_literal: true

module Helo
  class Client < Helo::Core::Client
    # Identifies the package and the Ruby it is running on. RUBY_PLATFORM covers
    # OS and architecture in one ("arm64-darwin24", "x86_64-linux").
    USER_AGENT = "helo-email-sdk/1.0.0-beta.9 (ruby #{RUBY_VERSION}; #{RUBY_PLATFORM})"

    def user_agent
      USER_AGENT
    end

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

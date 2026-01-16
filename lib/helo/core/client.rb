# frozen_string_literal: true

require "faraday"

module Helo::Core
  class Client
    attr_reader :configuration

    def initialize(configuration, default_headers: {})
      @configuration = configuration
      @default_headers = default_headers
      @connection = Faraday.new(url: configuration.base_url) do |f|
        f.request :json
        f.response :json
        f.adapter Faraday.default_adapter

        # Allow custom Faraday configuration
        configuration.faraday_configuration_block&.call(f)
      end
    end

    def with_headers(headers)
      self.class.new(configuration, default_headers: @default_headers.merge(headers))
    end

    def request(method, path, params: {}, body: nil)
      response = connection.public_send(method, path) do |req|
        req.params = params
        req.body = body

        # Set Authorization header with dynamic or static token
        token = current_access_token
        req.headers["Authorization"] = "Bearer #{token}" if token

        # Apply default headers (convert snake_case to Header-Case)
        @default_headers.each do |key, value|
          header_name = key.to_s.split("_").map(&:capitalize).join("-")
          req.headers[header_name] = value.to_s
        end
      end

      handle_response(response)
    end

    private

    attr_reader :connection

    def current_access_token
      token = configuration.access_token
      token.respond_to?(:call) ? token.call : token
    end

    def handle_response(response)
      case response.status
      when 200..299
        response
      else
        handle_error(response)
      end
    end

    # Override this method in subclasses to raise custom errors
    def handle_error(response)
      raise StandardError, "Request failed with status #{response.status}: #{response.body}"
    end
  end
end

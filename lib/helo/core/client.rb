# frozen_string_literal: true

require "faraday"

module Helo::Core
  class Client
    attr_reader :configuration

    def initialize(configuration)
      raise ArgumentError, "base_url is not configured" if configuration.base_url.to_s.empty?

      @configuration = configuration
      @connection = Faraday.new(url: configuration.base_url) do |f|
        f.request :json
        f.response :json
        f.adapter Faraday.default_adapter
        f.options.params_encoder = Faraday::FlatParamsEncoder

        # Allow custom Faraday configuration
        configuration.faraday_configuration_block&.call(f)
      end
    end

    def request(method, path, params: {}, body: nil, headers: {})
      response = connection.public_send(method, path) do |req|
        req.params = params
        req.body = body

        # Set Authorization header with dynamic or static token
        token = current_api_key
        req.headers["Authorization"] = "Bearer #{token}" if token

        # Apply per-request headers verbatim (already in wire form)
        headers.each do |key, value|
          req.headers[key.to_s] = value.to_s
        end
      end

      handle_response(response)
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
      handle_connection_error(e)
    end

    private

    attr_reader :connection

    def current_api_key
      token = configuration.api_key
      token.respond_to?(:call) ? token.call : token
    end

    def handle_response(response)
      case response.status
      when 200..299
        response
      else
        handle_error_response(response)
      end
    end

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

# frozen_string_literal: true

require "faraday"
require "faraday/retry"
require "securerandom"

module Helo::Core
  class Client
    attr_reader :configuration

    def self.idempotency_key
      SecureRandom.uuid
    end

    def initialize(configuration)
      raise ArgumentError, "base_url is not configured" if configuration.base_url.to_s.empty?

      @configuration = configuration
    end

    def request(method, path, params: {}, body: nil, headers: {})
      handle_response(send_request(method, path, params, body, headers))
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
      handle_connection_error(e)
    end

    # Overridden by the generated Client.
    def user_agent
      nil
    end

    private

    def send_request(method, path, params, body, headers)
      connection.public_send(method, path) do |req|
        req.params = params
        req.body = body

        token = current_api_key
        req.headers["Authorization"] = "Bearer #{token}" if token

        req.headers["User-Agent"] = user_agent if user_agent

        headers.each do |key, value|
          req.headers[key.to_s] = value.to_s
        end
      end
    end

    def retry_options
      {
        max: 2,
        interval: 0.5,
        backoff_factor: 2,
        interval_randomness: 0.5,
        max_interval: 8.0,
        retry_statuses: [ 408, 429, 500, 502, 503, 504 ],
        exceptions: [ Faraday::ConnectionFailed, Faraday::TimeoutError, Faraday::RetriableResponse ],
        methods: %i[get head options put delete],
        retry_if: method(:retry_non_idempotent?)
      }.merge(configuration.retry_options || {})
    end

    # Only asked about methods outside `methods`.
    def retry_non_idempotent?(env, exception)
      rate_limited = exception.is_a?(Faraday::RetriableResponse) && exception.response.status == 429
      rate_limited || env.request_headers.keys.any? { |name| name.downcase.end_with?("idempotency-key") }
    end

    def connection
      @_connection ||= Faraday.new(url: configuration.base_url) do |f|
        f.request :retry, retry_options
        f.request :json
        f.response :json
        f.adapter Faraday.default_adapter
        f.options.params_encoder = Faraday::FlatParamsEncoder

        configuration.faraday_configuration_block&.call(f)
      end
    end

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

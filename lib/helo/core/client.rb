# frozen_string_literal: true

require "faraday"
require "securerandom"
require "time"

module Helo::Core
  # Sends requests, retrying (up to configuration.max_retries times, with jittered
  # backoff) after a network failure or a 408, 429 or 5xx response, but only when
  # repeating the request cannot do anything twice: its method is idempotent, or
  # it carries an idempotency key. A 429 is retried regardless, since the server
  # refused it without acting on it. A Retry-After longer than the SDK waits is
  # not retried early; the error goes to the caller.
  #
  # The same policy as every Helo SDK (Helo::SdkGeneratorCommon::Retries in
  # helo-sdk-generator); keep these numbers in step with it.
  class Client
    INITIAL_RETRY_DELAY = 0.5
    MAX_RETRY_DELAY = 8.0
    RETRY_STATUSES = [ 408, 429, 500, 502, 503, 504 ].freeze
    IDEMPOTENT_METHODS = %i[get head options put delete].freeze

    attr_reader :configuration

    # A random UUID, for an idempotency key the caller didn't supply.
    def self.idempotency_key
      SecureRandom.uuid
    end

    def initialize(configuration)
      raise ArgumentError, "base_url is not configured" if configuration.base_url.to_s.empty?

      @configuration = configuration
    end

    def request(method, path, params: {}, body: nil, headers: {})
      can_repeat = IDEMPOTENT_METHODS.include?(method.to_sym) ||
                   headers.keys.any? { |name| name.to_s.downcase.end_with?("idempotency-key") }
      attempt = 0

      loop do
        response = begin
          send_request(method, path, params, body, headers)
        rescue Faraday::ConnectionFailed, Faraday::TimeoutError
          raise unless can_repeat && attempt < max_retries

          sleep(backoff_delay(attempt))
          attempt += 1
          next
        end

        delay = retry_delay(response, attempt, can_repeat)
        return handle_response(response) unless delay

        sleep(delay)
        attempt += 1
      end
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
      handle_connection_error(e)
    end

    # The generated Client subclass overrides this with the package identity it
    # was generated for; Helo::Core on its own has no package to name.
    def user_agent
      nil
    end

    private

    def send_request(method, path, params, body, headers)
      connection.public_send(method, path) do |req|
        req.params = params
        req.body = body

        # Set Authorization header with dynamic or static token
        token = current_api_key
        req.headers["Authorization"] = "Bearer #{token}" if token

        req.headers["User-Agent"] = user_agent if user_agent

        # Apply per-request headers verbatim (already in wire form)
        headers.each do |key, value|
          req.headers[key.to_s] = value.to_s
        end
      end
    end

    def max_retries
      configuration.max_retries || 0
    end

    # How long to wait before retrying this response, or nil not to retry it.
    def retry_delay(response, attempt, can_repeat)
      status = response.status
      return nil if attempt >= max_retries || !RETRY_STATUSES.include?(status)
      return nil if status != 429 && !can_repeat

      retry_after = retry_after_seconds(response)
      return backoff_delay(attempt) if retry_after.nil?

      retry_after <= MAX_RETRY_DELAY ? retry_after : nil
    end

    # Exponential backoff with full jitter.
    def backoff_delay(attempt)
      rand * [ MAX_RETRY_DELAY, INITIAL_RETRY_DELAY * (2**attempt) ].min
    end

    # Retry-After as seconds, from either a number or an HTTP date.
    def retry_after_seconds(response)
      value = response.headers["retry-after"].to_s
      return nil if value.empty?
      return [ Float(value), 0.0 ].max if value.match?(/\A\d+(\.\d+)?\z/)

      delay = Time.httpdate(value) - Time.now
      delay.positive? ? delay : nil
    rescue ArgumentError
      nil
    end

    def connection
      @_connection ||= Faraday.new(url: configuration.base_url) do |f|
        f.request :json
        f.response :json
        f.adapter Faraday.default_adapter
        f.options.params_encoder = Faraday::FlatParamsEncoder

        # Allow custom Faraday configuration
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

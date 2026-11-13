# frozen_string_literal: true

module Helo::Core
  class Configuration
    # Retries after a network failure, timeout, 408, 429 or 5xx; 0 disables them.
    # See Helo::Core::Client for which requests are retried.
    DEFAULT_MAX_RETRIES = 2

    attr_accessor :base_url, :api_key, :max_retries
    attr_reader :faraday_configuration_block

    def initialize(base_url: nil, api_key: nil, max_retries: DEFAULT_MAX_RETRIES)
      @base_url = base_url
      @api_key = api_key
      @max_retries = max_retries
      @faraday_configuration_block = nil
    end

    def configure_faraday_connection(&block)
      @faraday_configuration_block = block
    end
  end
end

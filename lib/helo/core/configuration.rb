# frozen_string_literal: true

module Helo::Core
  class Configuration
    attr_accessor :base_url, :api_key, :retry_options
    attr_reader :faraday_configuration_block

    def initialize(base_url: nil, api_key: nil, retry_options: {})
      @base_url = base_url
      @api_key = api_key
      @retry_options = retry_options
      @faraday_configuration_block = nil
    end

    def configure_faraday_connection(&block)
      @faraday_configuration_block = block
    end
  end
end

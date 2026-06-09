# frozen_string_literal: true

module Helo::Core
  class Configuration
    attr_accessor :base_url, :api_key
    attr_reader :faraday_configuration_block

    def initialize(base_url: "https://api.example.com", api_key: nil)
      @base_url = base_url
      @api_key = api_key
      @faraday_configuration_block = nil
    end

    def configure_faraday_connection(&block)
      @faraday_configuration_block = block
    end
  end
end

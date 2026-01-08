# frozen_string_literal: true

module Helo::Core
  class Configuration
    attr_accessor :base_url, :access_token
    attr_reader :faraday_configuration_block

    def initialize
      @base_url = "https://api.example.com"
      @access_token = nil
      @faraday_configuration_block = nil
    end

    def configure_faraday_connection(&block)
      @faraday_configuration_block = block
    end
  end
end

# frozen_string_literal: true

module Helo
  class Configuration < Helo::Core::Configuration
    def initialize(base_url: "https://api.helohq.com", api_key: nil, max_retries: DEFAULT_MAX_RETRIES)
      super
    end
  end
end

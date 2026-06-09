# frozen_string_literal: true

module Helo
  class Configuration < Helo::Core::Configuration
    def initialize(base_url: "https://api.helohq.com", api_key: nil)
      super
    end
  end
end

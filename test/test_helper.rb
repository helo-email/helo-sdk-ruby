# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "helo-email-sdk"

require "minitest/autorun"
require "webmock/minitest"

Helo.configure do |config|
  config.base_url = "http://localhost:8002"
  config.api_key = "test-token-123"
end

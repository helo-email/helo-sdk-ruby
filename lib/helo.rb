# frozen_string_literal: true

# Define module hierarchy before loading core
module Helo; end

# Core framework
require_relative "helo/core/model_type"
require_relative "helo/core/array_type"
require_relative "helo/core/model"
require_relative "helo/core/configuration"
require_relative "helo/core/client"
require_relative "helo/core/api"

# SDK
require_relative "helo/version"
require_relative "helo/api_error"
require_relative "helo/configuration"
require_relative "helo/client"


module Helo
  def self.configure
    @configuration ||= Configuration.new
    yield(@configuration)
    API.default_client = Client.new(@configuration)
  end

  class API < Core::API
  end
end

Dir[File.join(__dir__, "helo", "enums", "*.rb")].sort.each { |file| require file }
Dir[File.join(__dir__, "helo", "models", "*.rb")].sort.each { |file| require file }
Dir[File.join(__dir__, "helo", "apis", "*.rb")].sort.each { |file| require file }

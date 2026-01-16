# frozen_string_literal: true

module Helo
  class ValidationError
    include Helo::Core::Model

    api_attribute :message, :string, key: "message"
  end
end

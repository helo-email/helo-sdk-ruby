# frozen_string_literal: true

module Helo
  class BroadcastSuppressionsResponse
    include Helo::Core::Model

    api_attribute :recipients, key: "recipients"
  end
end

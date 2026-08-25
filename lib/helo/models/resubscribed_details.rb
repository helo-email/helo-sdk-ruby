# frozen_string_literal: true

module Helo
  class ResubscribedDetails
    include Helo::Core::Model

    api_attribute :ip, :string, key: "ip"
  end
end

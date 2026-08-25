# frozen_string_literal: true

module Helo
  class BouncedDetails
    include Helo::Core::Model

    api_attribute :type, :string, key: "type"
    api_attribute :sub_type, :string, key: "subType"
    api_attribute :code, :string, key: "code"
  end
end

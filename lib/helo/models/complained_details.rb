# frozen_string_literal: true

module Helo
  class ComplainedDetails
    include Helo::Core::Model

    api_attribute :type, :string, key: "type"
  end
end

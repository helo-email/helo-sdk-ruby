# frozen_string_literal: true

module Helo
  class ClientDetails
    include Helo::Core::Model

    api_attribute :family, :string, key: "family"
    api_attribute :version, :string, key: "version"
  end
end

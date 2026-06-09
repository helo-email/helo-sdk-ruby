# frozen_string_literal: true

module Helo
  class ActivityMailAddress
    include Helo::Core::Model

    api_attribute :email, :string, key: "email"
    api_attribute :name, :string, key: "name"
  end
end

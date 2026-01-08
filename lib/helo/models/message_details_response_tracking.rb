# frozen_string_literal: true

module Helo
  class MessageDetailsResponseTracking
    include Helo::Core::Model

    api_attribute :links, :boolean, key: "links"
    api_attribute :opens, :boolean, key: "opens"
  end
end

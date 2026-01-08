# frozen_string_literal: true

module Helo
  class SendBroadcastRequestTracking
    include Helo::Core::Model

    api_attribute :opens, :boolean, key: "opens"
    api_attribute :links, :boolean, key: "links"
  end
end

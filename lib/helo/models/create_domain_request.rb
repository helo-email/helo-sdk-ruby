# frozen_string_literal: true

module Helo
  class CreateDomainRequest
    include Helo::Core::Model

    api_attribute :name, :string, key: "name"
    api_attribute :channel_ids, key: "channelIds"
  end
end

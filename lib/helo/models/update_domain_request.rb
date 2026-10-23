# frozen_string_literal: true

module Helo
  class UpdateDomainRequest
    include Helo::Core::Model

    api_attribute :channel_ids, key: "channelIds"
    api_attribute :enable_custom_tracking, :boolean, key: "enableCustomTracking"
  end
end

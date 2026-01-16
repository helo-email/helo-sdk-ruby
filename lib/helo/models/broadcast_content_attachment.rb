# frozen_string_literal: true

module Helo
  class BroadcastContentAttachment
    include Helo::Core::Model

    api_attribute :file_name, :string, key: "fileName"
    api_attribute :disposition, :string, key: "disposition"
    api_attribute :size, :integer, key: "size"
  end
end

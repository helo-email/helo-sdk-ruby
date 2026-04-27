# frozen_string_literal: true

module Helo
  class MessageDetailsResponseAttachment
    include Helo::Core::Model

    api_attribute :file_name, :string, key: "fileName"
    api_attribute :disposition, :string, key: "disposition"
    api_attribute :size, :float, key: "size"
  end
end

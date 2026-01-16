# frozen_string_literal: true

module Helo
  class SendMessageRequestAttachment
    include Helo::Core::Model

    api_attribute :content, :string, key: "content"
    api_attribute :content_id, :string, key: "contentId"
    api_attribute :content_type, :string, key: "contentType"
    api_attribute :file_name, :string, key: "fileName"
    api_attribute :disposition, :string, key: "disposition"
  end
end

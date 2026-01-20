# frozen_string_literal: true

module Helo
  class AttachmentDisposition
    ATTACHMENT = "attachment"
    INLINE = "inline"

    def self.all
      [ATTACHMENT, INLINE].freeze
    end
  end
end

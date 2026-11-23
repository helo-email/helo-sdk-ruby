# frozen_string_literal: true

module Helo
  class BatchValidationMode
    STRICT = "strict"
    RELAXED = "relaxed"

    def self.all
      [STRICT, RELAXED].freeze
    end
  end
end

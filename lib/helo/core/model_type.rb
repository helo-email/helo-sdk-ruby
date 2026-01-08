# frozen_string_literal: true

require "active_model"

module Helo::Core
  # Custom ActiveModel type for nested model objects
  class ModelType < ActiveModel::Type::Value
    def initialize(model_class_name)
      @model_class_name = model_class_name
      super()
    end

    def cast(value)
      return if value.nil?

      case value
      when model_class
        value
      when Hash
        model_class.from_hash(value)
      end
    end

    private

    def model_class
      @_model_class ||= @model_class_name.constantize
    end
  end
end

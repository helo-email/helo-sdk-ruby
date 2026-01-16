# frozen_string_literal: true

require "active_model"

module Helo::Core
  # Custom ActiveModel type for arrays of model objects
  class ArrayType < ActiveModel::Type::Value
    def initialize(model_class_name)
      @model_class_name = model_class_name
      super()
    end

    def cast(value)
      return if value.nil?

      value.map do |item|
        case item
        when model_class
          item
        when Hash
          model_class.from_hash(item)
        end
      end
    end

    private

    def model_class
      @_model_class ||= @model_class_name.constantize
    end
  end
end

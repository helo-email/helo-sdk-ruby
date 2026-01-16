# frozen_string_literal: true

require "active_model"
require "active_support/concern"
require "date"

module Helo::Core
  module Model
    extend ActiveSupport::Concern

    included do
      include ActiveModel::AttributeAssignment
      include ActiveModel::Attributes
      include ActiveModel::Serializers::JSON

      class_attribute :_api_attributes, default: {}

      def initialize(attributes = {})
        super()
        assign_attributes(attributes) if attributes
      end

      # Serialize to hash for API requests (camelCase keys)
      def to_params
        result = {}
        self.class._api_attributes.each do |attr_name, meta|
          value = public_send(attr_name)

          if value.nil?
            next unless meta[:nullable] && @_explicitly_set&.include?(attr_name)
          end

          result[meta[:json_key]] = serialize_for_api(value, meta)
        end
        result
      end

      def to_h
        attributes.to_h do |key, value|
          [ key.to_sym, deep_to_h(value) ]
        end
      end

      def slice(*keys)
        attributes.symbolize_keys.slice(*keys.map(&:to_sym))
      end

      def [](key)
        attributes[key.to_s]
      end

      def []=(key, value)
        public_send("#{key}=", value)
      end

      def inspect
        attrs = attributes.map { |k, v| "#{k}: #{v.inspect}" }.join(", ")
        "#<#{self.class.name} #{attrs}>"
      end

      private

      def _write_attribute(attr_name, value)
        @_explicitly_set ||= Set.new
        @_explicitly_set << attr_name.to_sym
        super
      end

      def deep_to_h(value)
        if value.is_a?(Array)
          value.map { |item| deep_to_h(item) }
        elsif value.respond_to?(:to_h)
          value.to_h
        else
          value
        end
      end

      def serialize_for_api(value, meta = {})
        return value if value.nil?

        case value
        when Array
          serialized = value.map { |item| serialize_for_api(item) }
          meta[:explode] == false ? serialized.join(",") : serialized
        when Time, DateTime
          value.utc.iso8601
        when Date
          value.to_s
        else
          value.respond_to?(:to_params) ? value.to_params : value
        end
      end
    end

    class_methods do
      def new(input = {})
        return input if input.is_a?(self)
        super(input)
      end

      def api_attribute(name, type = nil, key:, nullable: false, explode: true)
        attribute(name, type)

        self._api_attributes[name] = {
          json_key: key,
          nullable: nullable,
          explode: explode
        }
      end

      def from_hash(hash)
        return if hash.nil?

        hash = hash.transform_keys(&:to_sym)

        attributes = _api_attributes.to_h do |attr_name, meta|
          json_key = meta.fetch(:json_key).to_sym
          value = hash[json_key] || hash[attr_name]
          [ attr_name, value ]
        end

        new(attributes)
      end
    end
  end
end

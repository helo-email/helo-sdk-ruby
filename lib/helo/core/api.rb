# frozen_string_literal: true

module Helo::Core
  # Base class for all API resources
  class API
    class_attribute :default_client

    def self.class_methods(*methods)
      methods.each do |method|
        define_singleton_method(method) do |*args, **kwargs, &block|
          new(default_client).public_send(method, *args, **kwargs, &block)
        end
      end
    end

    def initialize(client)
      @client = client
    end
  end
end

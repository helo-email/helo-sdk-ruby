# frozen_string_literal: true

module Helo
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load(:action_mailer) do
      add_delivery_method :helo, Helo::Mailer
    end
  end
end

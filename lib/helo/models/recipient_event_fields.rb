# frozen_string_literal: true

module Helo
  class RecipientEventFields
    include Helo::Core::Model

    api_attribute :recipient, :string, key: "recipient"
    api_attribute :details, :string, key: "details"
  end
end

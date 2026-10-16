# frozen_string_literal: true

module Helo
  class RenderTemplateResponse
    include Helo::Core::Model

    api_attribute :subject, :string, key: "subject"
    api_attribute :html, :string, key: "html"
    api_attribute :text, :string, key: "text"
  end
end

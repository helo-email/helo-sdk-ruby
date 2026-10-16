# frozen_string_literal: true

module Helo
  class RenderDraftRequest
    include Helo::Core::Model

    api_attribute :subject, :string, key: "subject"
    api_attribute :html, :string, key: "html"
    api_attribute :mjml, :string, key: "mjml"
    api_attribute :text, :string, key: "text"
    api_attribute :inline_styles, :boolean, key: "inlineStyles"
    api_attribute :data, key: "data"
  end
end

# frozen_string_literal: true

module Helo
  class RenderTemplateRequest
    include Helo::Core::Model

    api_attribute :inline_styles, :boolean, key: "inlineStyles"
    api_attribute :data, key: "data"
  end
end

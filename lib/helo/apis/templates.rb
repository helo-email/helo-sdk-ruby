# frozen_string_literal: true

module Helo
  class Templates < API
    def list(request_data = {})
      request = TemplatesListRequest.new(request_data)
      response = @client.request(:get, "/templates", params: request.to_params)
      PaginatedResponseOfTemplateSummaryResponse.from_hash(response.body)
    end

    def create(request_data)
      request = CreateTemplateRequest.new(request_data)
      response = @client.request(:post, "/templates", body: request.to_params)
      TemplateResponse.from_hash(response.body)
    end

    def render_draft(request_data)
      request = RenderDraftRequest.new(request_data)
      response = @client.request(:post, "/templates/render", body: request.to_params)
      RenderTemplateResponse.from_hash(response.body)
    end

    def retrieve(id)
      response = @client.request(:get, "/templates/#{id}")
      TemplateResponse.from_hash(response.body)
    end

    def update(id, request_data)
      request = UpdateTemplateRequest.new(request_data)
      response = @client.request(:patch, "/templates/#{id}", body: request.to_params)
      TemplateResponse.from_hash(response.body)
    end

    def delete(id)
      response = @client.request(:delete, "/templates/#{id}")
      nil
    end

    def render(id, request_data)
      request = RenderTemplateRequest.new(request_data)
      response = @client.request(:post, "/templates/#{id}/render", body: request.to_params)
      RenderTemplateResponse.from_hash(response.body)
    end

    class_methods :list, :create, :render_draft, :retrieve, :update, :delete, :render
  end
end

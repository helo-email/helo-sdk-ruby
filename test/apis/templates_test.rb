# frozen_string_literal: true

require "test_helper"

class TemplatesTest < Minitest::Test
  def test_list
    request_data = {}

    stub_request(:get, "http://localhost:8002/templates")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Templates.list(request_data)

    assert_instance_of Helo::PaginatedResponseOfTemplateSummaryResponse, result
  end

  def test_create
    request_data = { name: "test-name", subject: "test-subject", html: "test-html", mjml: "test-mjml", text: "test-text", channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"] }

    stub_request(:post, "http://localhost:8002/templates")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Templates.create(request_data)

    assert_instance_of Helo::TemplateResponse, result
  end

  def test_render_draft
    request_data = { subject: "test-subject", html: "test-html", mjml: "test-mjml", text: "test-text", inline_styles: true, data: {} }

    stub_request(:post, "http://localhost:8002/templates/render")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Templates.render_draft(request_data)

    assert_instance_of Helo::RenderTemplateResponse, result
  end

  def test_retrieve
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:get, "http://localhost:8002/templates/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Templates.retrieve(id)

    assert_instance_of Helo::TemplateResponse, result
  end

  def test_update
    id = "550e8400-e29b-41d4-a716-446655440000"
    request_data = { name: "test-name", subject: "test-subject", html: "test-html", mjml: "test-mjml", text: "test-text", channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"], version: 123 }

    stub_request(:patch, "http://localhost:8002/templates/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Templates.update(id, request_data)

    assert_instance_of Helo::TemplateResponse, result
  end

  def test_delete
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:delete, "http://localhost:8002/templates/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 204)

    result = Helo::Templates.delete(id)

    assert_nil result
  end

  def test_render
    id = "550e8400-e29b-41d4-a716-446655440000"
    request_data = { inline_styles: true, data: {} }

    stub_request(:post, "http://localhost:8002/templates/#{id}/render")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Templates.render(id, request_data)

    assert_instance_of Helo::RenderTemplateResponse, result
  end
end

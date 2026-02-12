# frozen_string_literal: true

require "test_helper"

class WebhookEndpointsTest < Minitest::Test
  def test_list
    request_data = {}

    stub_request(:get, "http://localhost:8002/webhook-endpoints")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::WebhookEndpoints.list(request_data)

    assert_instance_of Helo::PaginationResultOfWebhookEndpointResponse, result
  end

  def test_create
    request_data = { url: "test-url", events: ["accepted", "processed"], channel_id: "550e8400-e29b-41d4-a716-446655440000", additional_headers: [], enabled: true }

    stub_request(:post, "http://localhost:8002/webhook-endpoints")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::WebhookEndpoints.create(request_data)

    assert_instance_of Helo::WebhookEndpointResponse, result
  end

  def test_retrieve
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:get, "http://localhost:8002/webhook-endpoints/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::WebhookEndpoints.retrieve(id)

    assert_instance_of Helo::WebhookEndpointResponse, result
  end

  def test_update
    id = "550e8400-e29b-41d4-a716-446655440000"
    request_data = { url: "test-url", events: ["accepted", "processed"], channel_id: "550e8400-e29b-41d4-a716-446655440000", additional_headers: [], enabled: true }

    stub_request(:patch, "http://localhost:8002/webhook-endpoints/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::WebhookEndpoints.update(id, request_data)

    assert_instance_of Helo::WebhookEndpointResponse, result
  end

  def test_delete
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:delete, "http://localhost:8002/webhook-endpoints/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 204)

    result = Helo::WebhookEndpoints.delete(id)

    assert_nil result
  end

  def test_regenerate_signing_key
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:post, "http://localhost:8002/webhook-endpoints/#{id}/regenerate-signing-key")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::WebhookEndpoints.regenerate_signing_key(id)

    assert_instance_of Helo::WebhookEndpointResponse, result
  end
end

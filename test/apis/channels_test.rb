# frozen_string_literal: true

require "test_helper"

class ChannelsTest < Minitest::Test
  def test_list
    request_data = {}

    stub_request(:get, "http://localhost:8002/channels")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Channels.list(request_data)

    assert_instance_of Helo::PaginationResultOfChannelResponse, result
  end

  def test_create
    request_data = { name: "test-name", delivery_type: Helo::DeliveryType::LIVE }

    stub_request(:post, "http://localhost:8002/channels")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Channels.create(request_data)

    assert_instance_of Helo::ChannelResponse, result
  end

  def test_retrieve
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:get, "http://localhost:8002/channels/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Channels.retrieve(id)

    assert_instance_of Helo::ChannelResponse, result
  end

  def test_update
    id = "550e8400-e29b-41d4-a716-446655440000"
    request_data = { name: "test-name", delivery_type: Helo::DeliveryType::LIVE, track_links: true, track_opens: true }

    stub_request(:patch, "http://localhost:8002/channels/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Channels.update(id, request_data)

    assert_instance_of Helo::ChannelResponse, result
  end

  def test_delete
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:delete, "http://localhost:8002/channels/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 204)

    result = Helo::Channels.delete(id)

    assert_nil result
  end
end

# frozen_string_literal: true

require "test_helper"

class BroadcastsTest < Minitest::Test
  def test_list
    request_data = {}

    stub_request(:get, "http://localhost:8002/broadcasts")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Broadcasts.list(request_data)

    assert_instance_of Helo::PaginatedResponseOfBroadcastResponse, result
  end

  def test_retrieve
    id = "00000000-0000-0000-0000-000000000000"

    stub_request(:get, "http://localhost:8002/broadcasts/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Broadcasts.retrieve(id)

    assert_instance_of Helo::BroadcastDetailsResponse, result
  end

  def test_list_failures
    id = "00000000-0000-0000-0000-000000000000"

    stub_request(:get, "http://localhost:8002/broadcasts/#{id}/failures")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Broadcasts.list_failures(id)

    assert_instance_of Helo::BroadcastFailuresResponse, result
  end

  def test_list_suppressions
    id = "00000000-0000-0000-0000-000000000000"

    stub_request(:get, "http://localhost:8002/broadcasts/#{id}/suppressions")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Broadcasts.list_suppressions(id)

    assert_instance_of Helo::BroadcastSuppressionsResponse, result
  end
end

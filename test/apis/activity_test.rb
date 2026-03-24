# frozen_string_literal: true

require "test_helper"

class ActivityTest < Minitest::Test
  def test_list_events
    request_data = {}

    stub_request(:get, "http://localhost:8002/activity/events")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Activity.list_events(request_data)

    assert_instance_of Helo::PaginatedEventsResponse, result
  end

  def test_list_messages
    request_data = {}

    stub_request(:get, "http://localhost:8002/activity/messages")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Activity.list_messages(request_data)

    assert_instance_of Helo::PaginatedMessagesResponse, result
  end

  def test_retrieve_message
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:get, "http://localhost:8002/activity/messages/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Activity.retrieve_message(id)

    assert_instance_of Helo::MessageDetailsResponse, result
  end
end

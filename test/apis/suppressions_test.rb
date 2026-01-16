# frozen_string_literal: true

require "test_helper"

class SuppressionsTest < Minitest::Test
  def test_list
    request_data = {}

    stub_request(:get, "http://localhost:8002/suppressions")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Suppressions.list(request_data)

    assert_instance_of Helo::PaginatedResponseOfSuppressionResponse, result
  end

  def test_create
    request_data = { channel_id: "550e8400-e29b-41d4-a716-446655440000", mail_type: Helo::MailType::TRANSACTIONAL, emails: ["example1", "example2"] }

    stub_request(:post, "http://localhost:8002/suppressions")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Suppressions.create(request_data)

    assert_instance_of Helo::CreateSuppressionsResponse, result
  end

  def test_remove
    request_data = { channel_id: "550e8400-e29b-41d4-a716-446655440000", mail_type: Helo::MailType::TRANSACTIONAL, emails: ["example1", "example2"] }

    stub_request(:post, "http://localhost:8002/suppressions/remove")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Suppressions.remove(request_data)

    assert_instance_of Helo::RemoveSuppressionsResponse, result
  end
end

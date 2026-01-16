# frozen_string_literal: true

require "test_helper"

class DomainsTest < Minitest::Test
  def test_list
    request_data = {}

    stub_request(:get, "http://localhost:8002/domains")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Domains.list(request_data)

    assert_instance_of Helo::PaginatedResponseOfDomainResponse, result
  end

  def test_create
    request_data = { name: "test-name" }

    stub_request(:post, "http://localhost:8002/domains")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Domains.create(request_data)

    assert_instance_of Helo::DomainWithDnsResponse, result
  end

  def test_retrieve
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:get, "http://localhost:8002/domains/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Domains.retrieve(id)

    assert_instance_of Helo::DomainWithDnsResponse, result
  end

  def test_update
    id = "550e8400-e29b-41d4-a716-446655440000"
    request_data = { channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"] }

    stub_request(:patch, "http://localhost:8002/domains/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Domains.update(id, request_data)

    assert_instance_of Helo::DomainResponse, result
  end

  def test_delete
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:delete, "http://localhost:8002/domains/#{id}")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 204)

    result = Helo::Domains.delete(id)

    assert_nil result
  end

  def test_verify
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:post, "http://localhost:8002/domains/#{id}/verify")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Domains.verify(id)

    assert_instance_of Helo::DnsRecordsResponse, result
  end

  def test_rotate_key
    id = "550e8400-e29b-41d4-a716-446655440000"

    stub_request(:post, "http://localhost:8002/domains/#{id}/rotate-key")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Domains.rotate_key(id)

    assert_instance_of Helo::DnsRecordResponse, result
  end
end

# frozen_string_literal: true

require "test_helper"

# The retry policy every Helo SDK shares.
class RetriesTest < Minitest::Test
  URL = "http://localhost:8002/things"
  JSON_HEADERS = { "Content-Type" => "application/json" }.freeze

  def client(max_retries: 2)
    Helo::Client.new(
      Helo::Configuration.new(base_url: "http://localhost:8002", api_key: "test-key", max_retries: max_retries)
    )
  end

  def test_retries_an_idempotent_request
    stub_request(:get, URL).to_return({ status: 503, headers: { "Retry-After" => "0" } },
                                      { status: 200, body: "{}", headers: JSON_HEADERS })

    assert_equal 200, client.request(:get, "/things").status
    assert_requested :get, URL, times: 2
  end

  def test_retries_a_post_carrying_an_idempotency_key
    stub_request(:post, URL).to_return({ status: 502, headers: { "Retry-After" => "0" } }, { status: 204 })

    client.request(:post, "/things", body: {}, headers: { "X-Example-Idempotency-Key" => "key-1" })

    assert_requested :post, URL, times: 2, headers: { "X-Example-Idempotency-Key" => "key-1" }
  end

  # Without a key, the server may have acted on the first attempt before failing.
  def test_does_not_retry_a_post_without_an_idempotency_key
    stub_request(:post, URL).to_return(status: 503, headers: { "Retry-After" => "0" })

    error = assert_raises(Helo::APIError) { client.request(:post, "/things", body: {}) }
    assert_equal 503, error.code
    assert_requested :post, URL, times: 1
  end

  def test_does_not_retry_a_post_without_a_key_after_a_network_error
    stub_request(:post, URL).to_timeout

    assert_raises(Helo::ConnectionError) { client.request(:post, "/things", body: {}) }
    assert_requested :post, URL, times: 1
  end

  def test_retries_a_network_error_on_an_idempotent_request
    stub_request(:get, URL).to_timeout.then.to_return(status: 200, body: "{}", headers: JSON_HEADERS)

    assert_equal 200, client.request(:get, "/things").status
  end

  # A 429 means the server refused the request without acting on it.
  def test_retries_a_rate_limited_post_even_without_a_key
    stub_request(:post, URL).to_return({ status: 429, headers: { "Retry-After" => "0" } }, { status: 204 })

    assert_equal 204, client.request(:post, "/things", body: {}).status
  end

  def test_does_not_retry_early_when_retry_after_is_longer_than_it_waits
    stub_request(:get, URL).to_return(status: 429, headers: { "Retry-After" => "60" })

    error = assert_raises(Helo::APIError) { client.request(:get, "/things") }
    assert_equal 429, error.code
    assert_requested :get, URL, times: 1
  end

  def test_gives_up_after_max_retries
    stub_request(:get, URL).to_return(status: 500, headers: { "Retry-After" => "0" })

    assert_raises(Helo::APIError) { client(max_retries: 1).request(:get, "/things") }
    assert_requested :get, URL, times: 2
  end

  def test_max_retries_zero_disables_retries
    stub_request(:get, URL).to_return(status: 503, headers: { "Retry-After" => "0" })

    assert_raises(Helo::APIError) { client(max_retries: 0).request(:get, "/things") }
    assert_requested :get, URL, times: 1
  end

  # A send whose response is lost must not be sent twice: the SDK generates a key
  # when the caller doesn't pass one, and reuses it on the retry.
  def test_generates_one_idempotency_key_per_call
    keys = []
    stub_request(:post, "http://localhost:8002/send/transactional")
      .with { |request| keys << request.headers["X-Helo-Idempotency-Key"] }
      .to_return({ status: 503, headers: { "Retry-After" => "0" } }, { status: 200, body: "{}", headers: JSON_HEADERS })

    Helo::Sending.send_transactional({ from: { email: "from@yourdomain.com", name: "From name" }, to: [{ email: "to@example.com", name: "To name" }], cc: [{ email: "cc@example.com", name: "Cc name" }], bcc: [{ email: "bcc@example.com", name: "Bcc name" }], reply_to: [{ email: "reply-to@example.com", name: "Reply-To name" }], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", tracking: { opens: true, links: true }, attachments: [{ content: "SGVsbG8gd29ybGQ=", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }], tags: ["welcome", "onboarding"], headers: {}, metadata: {} })

    assert_equal 2, keys.size
    assert_equal keys.first, keys.last
    assert_match(/\A\h{8}-\h{4}-4\h{3}-\h{4}-\h{12}\z/, keys.first)
  end
end

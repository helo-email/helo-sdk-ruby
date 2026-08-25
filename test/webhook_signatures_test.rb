# frozen_string_literal: true

require "test_helper"

class WebhookSignaturesTest < Minitest::Test
  SIGNING_KEY = "whsec_test"
  BODY = '{"event":"message.delivered"}'
  SIGNATURES = Helo::WebhookSignatures

  def test_accepts_a_valid_signature
    assert SIGNATURES.verify!(valid_header, BODY, SIGNING_KEY)
    assert SIGNATURES.valid?(valid_header, BODY, SIGNING_KEY)
  end

  # A sender rolling out a new signing scheme emits every version at once. This
  # SDK must keep verifying the versions it knows and ignore the rest,
  # otherwise the rollout breaks every receiver that has not upgraded yet.
  def test_ignores_unknown_versions_and_elements
    timestamp = Time.now.to_i.to_s
    signature = SIGNATURES.generate(BODY, SIGNING_KEY, timestamp)

    [
      "t=#{timestamp},v1=#{signature},v2=8badf00d",
      "t=#{timestamp},v2=8badf00d,v1=#{signature}",
      "t=#{timestamp},v1=#{signature},alg=sha512",
      "t=#{timestamp}, v1=#{signature}",
      "v1=#{signature},t=#{timestamp}",
      "t=#{timestamp},v1=8badf00d,v1=#{signature}"
    ].each do |header|
      assert SIGNATURES.valid?(header, BODY, SIGNING_KEY), "expected #{header} to be valid"
    end
  end

  def test_rejects_a_signature_from_a_different_key
    assert_raises(SIGNATURES::SignatureMismatchError) do
      SIGNATURES.verify!(valid_header, BODY, "wrong-key")
    end
    refute SIGNATURES.valid?(valid_header, BODY, "wrong-key")
  end

  def test_rejects_a_tampered_body
    assert_raises(SIGNATURES::SignatureMismatchError) do
      SIGNATURES.verify!(valid_header, '{"event":"message.bounced"}', SIGNING_KEY)
    end
  end

  def test_rejects_a_stale_timestamp
    timestamp = (Time.now.to_i - 600).to_s
    header = "t=#{timestamp},v1=#{SIGNATURES.generate(BODY, SIGNING_KEY, timestamp)}"

    error = assert_raises(SIGNATURES::TimestampSkewError) do
      SIGNATURES.verify!(header, BODY, SIGNING_KEY)
    end
    assert_match(/tolerance/, error.message)
  end

  def test_rejects_a_header_carrying_only_unknown_versions
    timestamp = Time.now.to_i.to_s
    header = "t=#{timestamp},v2=#{SIGNATURES.generate(BODY, SIGNING_KEY, timestamp)}"

    error = assert_raises(SIGNATURES::UnsupportedVersionError) do
      SIGNATURES.verify!(header, BODY, SIGNING_KEY)
    end
    assert_match(/v2/, error.message)
  end

  def test_rejects_malformed_headers
    timestamp = Time.now.to_i.to_s

    [
      "garbage",
      "",
      nil,
      "t=#{timestamp},v1=ABCDEF",
      "t=#{timestamp}",
      "v1=#{SIGNATURES.generate(BODY, SIGNING_KEY, timestamp)}",
      "t=yesterday,v1=#{SIGNATURES.generate(BODY, SIGNING_KEY, timestamp)}"
    ].each do |header|
      assert_raises(SIGNATURES::MalformedHeaderError, "expected #{header.inspect} to be malformed") do
        SIGNATURES.verify!(header, BODY, SIGNING_KEY)
      end
    end

    assert_raises(SIGNATURES::SignatureMismatchError) do
      SIGNATURES.verify!("t=#{timestamp},v1=abc", BODY, SIGNING_KEY)
    end
  end

  def test_every_rejection_shares_one_rescuable_base_class
    refute SIGNATURES.valid?("garbage", BODY, SIGNING_KEY)

    assert_raises(SIGNATURES::Error) do
      SIGNATURES.verify!("garbage", BODY, SIGNING_KEY)
    end
  end

  private

  def valid_header
    timestamp = Time.now.to_i.to_s
    "t=#{timestamp},v1=#{SIGNATURES.generate(BODY, SIGNING_KEY, timestamp)}"
  end
end

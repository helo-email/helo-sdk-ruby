# frozen_string_literal: true

require "openssl"

module Helo
  # Helpers for verifying the signature on an incoming webhook request.
  module WebhookSignatures
    # Base class for every rejection reason, so callers that do not care why a
    # webhook was rejected can rescue this one class.
    class Error < StandardError; end

    # The header was not in the documented
    # t={timestamp},v{version}={signature} form.
    class MalformedHeaderError < Error; end

    # The header carried only signing schemes this SDK does not know how to
    # verify. Upgrading the SDK is the fix; see SUPPORTED_VERSIONS.
    class UnsupportedVersionError < Error; end

    # The signature was correctly formed but its timestamp is too far from the
    # current time, so it may be a replay.
    class TimestampSkewError < Error; end

    # The signature did not match the body, either because the body was tampered
    # with or the signing key is wrong.
    class SignatureMismatchError < Error; end

    # Signing schemes this SDK can verify. The signature header may carry several
    # versions at once (t=...,v1=...,v2=...) so that a new scheme can be rolled
    # out while receivers upgrade; verification uses the newest version present
    # that appears in this list, and ignores the rest.
    SUPPORTED_VERSIONS = [1].freeze

    TIMESTAMP_VALUE_REGEX = /\A\d+\z/
    SIGNATURE_KEY_REGEX = /\Av(\d+)\z/
    HEX_SIGNATURE_REGEX = /\A[a-f0-9]+\z/
    MAX_TIMESTAMP_SKEW_SECONDS = 300 # 5 minutes

    class << self
      # Verify a webhook signature header against the raw request body.
      #
      # @param signature_header [String] value of the signature header sent with the webhook
      # @param request_body [String] raw (unparsed) request body
      # @param signing_key [String] signing key for the webhook endpoint
      # @return [true] when the signature is valid
      # @raise [Error] a subclass describing why the signature was rejected
      def verify!(signature_header, request_body, signing_key)
        timestamp, signatures = parse_header(signature_header)

        version = newest_supported_version(signatures)
        unless version
          raise UnsupportedVersionError,
                "Unsupported webhook signature version: header carries only " \
                "#{signatures.keys.sort.map { |v| "v#{v}" }.join(', ')}"
        end

        skew = (Time.now.to_i - timestamp.to_i).abs
        if skew > MAX_TIMESTAMP_SKEW_SECONDS
          raise TimestampSkewError,
                "Webhook signature timestamp outside tolerance: off by #{skew}s, " \
                "tolerance is #{MAX_TIMESTAMP_SKEW_SECONDS}s"
        end

        computed = signature_for_version(version, request_body, signing_key, timestamp)
        unless signatures.fetch(version).any? { |signature| secure_compare(computed, signature) }
          raise SignatureMismatchError, "Webhook signature mismatch"
        end

        true
      end

      # Verify a webhook signature header, returning false instead of raising.
      #
      # @see #verify!
      # @return [Boolean]
      def valid?(signature_header, request_body, signing_key)
        verify!(signature_header, request_body, signing_key)
      rescue Error
        false
      end

      # Compute the hex-encoded HMAC-SHA256 signature for a webhook payload,
      # using the v1 signing scheme.
      #
      # @param payload [String] raw (unparsed) request body
      # @param key [String] signing key for the webhook endpoint
      # @param timestamp [String] unix timestamp in seconds, as sent in the signature header
      # @return [String]
      def generate(payload, key, timestamp)
        OpenSSL::HMAC.hexdigest("SHA256", key, "#{timestamp}.#{payload}")
      end

      private

      # Compute the signature for one signing scheme. This is the single place a
      # new scheme needs to be added.
      def signature_for_version(version, payload, key, timestamp)
        case version
        when 1 then generate(payload, key, timestamp)
        end
      end

      # Split the header into its timestamp and its signatures keyed by version.
      # Elements that are not recognized are ignored, so that a sender adding new
      # elements does not break verification here.
      def parse_header(signature_header)
        timestamp = nil
        signatures = Hash.new { |hash, key| hash[key] = [] }

        signature_header.to_s.split(",").each do |element|
          key, value = element.strip.split("=", 2)
          next if value.nil?

          if key == "t"
            raise MalformedHeaderError, "Malformed webhook signature header" unless TIMESTAMP_VALUE_REGEX.match?(value)

            timestamp = value
            next
          end

          match = SIGNATURE_KEY_REGEX.match(key)
          next unless match

          version = match[1].to_i

          # Only versions this SDK verifies have a signature format it can insist
          # on; anything else is recorded but left unchecked.
          if SUPPORTED_VERSIONS.include?(version) && !HEX_SIGNATURE_REGEX.match?(value)
            raise MalformedHeaderError, "Malformed webhook signature header"
          end

          signatures[version] << value
        end

        if timestamp.nil? || signatures.empty?
          raise MalformedHeaderError, "Malformed webhook signature header"
        end

        [timestamp, signatures]
      end

      # Pick the highest version present that this SDK can verify, so that once a
      # sender emits a newer scheme the older one stops being honored here.
      def newest_supported_version(signatures)
        (signatures.keys & SUPPORTED_VERSIONS).max
      end

      def secure_compare(computed, given)
        return false unless computed.bytesize == given.bytesize

        OpenSSL.fixed_length_secure_compare(computed, given)
      end
    end
  end
end

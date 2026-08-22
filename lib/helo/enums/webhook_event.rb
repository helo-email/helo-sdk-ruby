# frozen_string_literal: true

module Helo
  class WebhookEvent
    ACCEPTED = "accepted"
    PROCESSED = "processed"
    BOUNCED = "bounced"
    DELIVERED = "delivered"
    OPENED = "opened"
    CLICKED = "clicked"
    COMPLAINED = "complained"
    UNSUBSCRIBED = "unsubscribed"
    RESUBSCRIBED = "resubscribed"
    DOMAIN_KEY_VERIFIED = "domain-key-verified"
    DOMAIN_KEY_VERIFICATION_FAILED = "domain-key-verification-failed"
    RETURN_PATH_DOMAIN_VERIFIED = "return-path-domain-verified"
    RETURN_PATH_DOMAIN_VERIFICATION_FAILED = "return-path-domain-verification-failed"

    def self.all
      [ACCEPTED, PROCESSED, BOUNCED, DELIVERED, OPENED, CLICKED, COMPLAINED, UNSUBSCRIBED, RESUBSCRIBED, DOMAIN_KEY_VERIFIED, DOMAIN_KEY_VERIFICATION_FAILED, RETURN_PATH_DOMAIN_VERIFIED, RETURN_PATH_DOMAIN_VERIFICATION_FAILED].freeze
    end
  end
end

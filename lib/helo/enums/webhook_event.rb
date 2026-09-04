# frozen_string_literal: true

module Helo
  class WebhookEvent
    MESSAGE_ACCEPTED = "message-accepted"
    MESSAGE_PROCESSED = "message-processed"
    EMAIL_DELIVERED = "email-delivered"
    EMAIL_BOUNCED = "email-bounced"
    EMAIL_OPENED = "email-opened"
    LINK_CLICKED = "link-clicked"
    RECIPIENT_COMPLAINED = "recipient-complained"
    RECIPIENT_UNSUBSCRIBED = "recipient-unsubscribed"
    RECIPIENT_RESUBSCRIBED = "recipient-resubscribed"
    DOMAIN_KEY_VERIFIED = "domain-key-verified"
    DOMAIN_KEY_VERIFICATION_FAILED = "domain-key-verification-failed"
    RETURN_PATH_DOMAIN_VERIFIED = "return-path-domain-verified"
    RETURN_PATH_DOMAIN_VERIFICATION_FAILED = "return-path-domain-verification-failed"

    def self.all
      [MESSAGE_ACCEPTED, MESSAGE_PROCESSED, EMAIL_DELIVERED, EMAIL_BOUNCED, EMAIL_OPENED, LINK_CLICKED, RECIPIENT_COMPLAINED, RECIPIENT_UNSUBSCRIBED, RECIPIENT_RESUBSCRIBED, DOMAIN_KEY_VERIFIED, DOMAIN_KEY_VERIFICATION_FAILED, RETURN_PATH_DOMAIN_VERIFIED, RETURN_PATH_DOMAIN_VERIFICATION_FAILED].freeze
    end
  end
end

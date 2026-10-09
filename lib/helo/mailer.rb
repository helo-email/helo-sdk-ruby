# frozen_string_literal: true

module Helo
  # ActionMailer delivery method, registered as :helo by the Railtie.
  class Mailer
    STANDARD_HEADERS = %w[
      from to cc bcc reply-to subject date message-id mime-version
      content-type content-transfer-encoding content-disposition content-id
      sender return-path
    ].freeze

    # Where the API's id for the message is recorded after sending
    MESSAGE_ID_FIELD = "helo-message-id"

    attr_reader :settings

    # Receives mail(delivery_method_options: { ... }) as settings. return_response makes
    # Mail::Message#deliver! return our response.
    def initialize(settings = {})
      @settings = settings.merge(return_response: true)
    end

    def deliver!(mail)
      raise ArgumentError, "Helo is not configured: call Helo.configure" unless API.default_client

      response = Sending.send_transactional(
        build_request(mail),
        channel_id: settings[:channel_id],
        idempotency_key: settings[:idempotency_key]
      )
      if response&.message_id
        mail[MESSAGE_ID_FIELD] = nil # Mail would otherwise add a second field when resending
        mail[MESSAGE_ID_FIELD] = response.message_id
      end
      response
    end

    private

    def build_request(mail)
      {
        from: addresses(mail[:from]).first,
        to: addresses(mail[:to]),
        cc: addresses(mail[:cc]),
        bcc: addresses(mail[:bcc]),
        reply_to: addresses(mail[:reply_to]),
        subject: mail.subject,
        html: body(mail, "text/html"),
        text: body(mail, "text/plain"),
        attachments: attachments(mail),
        headers: custom_headers(mail),
        tags: settings[:tags],
        metadata: settings[:metadata],
        tracking: settings[:tracking]
      }.compact_blank
    end

    def addresses(field)
      return [] unless field
      raise ArgumentError, "Invalid #{field.name} address: #{field.value}" unless field.respond_to?(:addrs)

      field.addrs.map { |address| { email: address.address, name: address.display_name }.compact }
    end

    def body(mail, mime_type)
      if mail.multipart?
        part = mime_type == "text/html" ? mail.html_part : mail.text_part
        part&.decoded
      elsif (mail.mime_type || "text/plain") == mime_type
        mail.decoded
      end
    end

    def attachments(mail)
      mail.attachments.map do |attachment|
        {
          content: [attachment.decoded].pack("m0"),
          file_name: attachment.filename,
          content_type: attachment.mime_type,
          disposition: attachment.inline? ? "inline" : "attachment",
          content_id: (attachment.cid if attachment.inline?)
        }.compact
      end
    end

    def custom_headers(mail)
      mail.header_fields.each_with_object({}) do |field, headers|
        next if STANDARD_HEADERS.include?(field.name.downcase) || field.name.downcase == MESSAGE_ID_FIELD

        headers[field.name] = field.value.to_s
      end
    end
  end
end

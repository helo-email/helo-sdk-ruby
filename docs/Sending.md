# Helo::Sending

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**transactional**](Sending.md#transactional) | **POST** /send/transactional | Send a transactional email |
| [**transactional_batch**](Sending.md#transactional_batch) | **POST** /send/transactional/batch | Send transactional emails in batch |
| [**broadcast**](Sending.md#broadcast) | **POST** /send/broadcast | Send a broadcast email |
| [**broadcast_message**](Sending.md#broadcast_message) | **POST** /send/broadcast/message | Send a single broadcast email |


## transactional

> <SendMessageAcceptedResponse> transactional(send_message_request, channel_id:, idempotency_key:)

Send a transactional email

Sends a single transactional email such as receipts, confirmations, or notifications.

### Example

```ruby Sending_transactional
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_message_request = Helo::SendMessageRequest.new(
  from: Helo::MailAddress.new(email: "from@yourdomain.com", name: "From name"),
  to: [Helo::MailAddress.new(email: "to@example.com", name: "To name")],
  cc: [Helo::MailAddress.new(email: "cc@example.com", name: "Cc name")],
  bcc: [Helo::MailAddress.new(email: "bcc@example.com", name: "Bcc name")],
  reply_to: [Helo::MailAddress.new(email: "reply-to@example.com", name: "Reply-To name")],
  subject: "Hello from Helo",
  html: "<h1>Welcome to Helo!</h1>",
  text: "Welcome to Helo!",
  template: {},
  tracking: {},
  attachments: [Helo::Attachment.new(content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT)],
  tags: ["welcome", "onboarding"],
  headers: {},
  metadata: {}
)
Helo::Sending.transactional(send_message_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


## transactional_batch

> <SendMessageBatchResponse> transactional_batch(send_message_batch_request, channel_id:, idempotency_key:)

Send transactional emails in batch

Sends multiple transactional emails in a single API request for better performance.

### Example

```ruby Sending_transactionalBatch
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_message_batch_request = Helo::SendMessageBatchRequest.new(
  requests: [Helo::SendMessageRequest.new(to: [], cc: [], bcc: [], reply_to: [], subject: "test-subject", html: "test-html", text: "test-text", template: {}, tracking: {}, attachments: [], tags: ["example1", "example2"], headers: {}, metadata: {})]
)
Helo::Sending.transactional_batch(send_message_batch_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


## broadcast

> <SendBroadcastResponse> broadcast(send_broadcast_request, channel_id:, idempotency_key:)

Send a broadcast email

Sends a broadcast email to multiple recipients for marketing or announcement purposes.

### Example

```ruby Sending_broadcast
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_broadcast_request = Helo::SendBroadcastRequest.new(
  from: Helo::MailAddress.new(email: "test-email", name: "test-name"),
  reply_to: [Helo::MailAddress.new(email: "test-email", name: "test-name")],
  template: {},
  tracking: {},
  attachments: [Helo::Attachment.new(content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT)],
  tags: ["example1", "example2"],
  headers: {},
  metadata: {},
  messages: []
)
Helo::Sending.broadcast(send_broadcast_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


## broadcast_message

> <SendMessageAcceptedResponse> broadcast_message(send_message_request, channel_id:, idempotency_key:)

Send a single broadcast email

Sends a single broadcast email message.

### Example

```ruby Sending_broadcastMessage
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_message_request = Helo::SendMessageRequest.new(
  from: Helo::MailAddress.new(email: "from@yourdomain.com", name: "From name"),
  to: [Helo::MailAddress.new(email: "to@example.com", name: "To name")],
  cc: [Helo::MailAddress.new(email: "cc@example.com", name: "Cc name")],
  bcc: [Helo::MailAddress.new(email: "bcc@example.com", name: "Bcc name")],
  reply_to: [Helo::MailAddress.new(email: "reply-to@example.com", name: "Reply-To name")],
  subject: "Hello from Helo",
  html: "<h1>Welcome to Helo!</h1>",
  text: "Welcome to Helo!",
  template: {},
  tracking: {},
  attachments: [Helo::Attachment.new(content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT)],
  tags: ["welcome", "onboarding"],
  headers: {},
  metadata: {}
)
Helo::Sending.broadcast_message(send_message_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


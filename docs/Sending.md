# Helo::Sending

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**send_transactional**](Sending.md#send_transactional) | **POST** /send/transactional | Send a transactional email |
| [**send_transactional_batch**](Sending.md#send_transactional_batch) | **POST** /send/transactional/batch | Send transactional emails in batch |
| [**send_broadcast**](Sending.md#send_broadcast) | **POST** /send/broadcast | Send a broadcast |
| [**send_broadcast_message**](Sending.md#send_broadcast_message) | **POST** /send/broadcast/message | Send a single broadcast email |


## send_transactional

> <SendMessageAcceptedResponse> send_transactional(send_message_request, channel_id:, idempotency_key:)

Send a transactional email

Sends a single transactional email such as receipts, confirmations, or notifications.

### Example

```ruby Sending_sendTransactional
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_message_request = Helo::SendMessageRequest.new(
  from: { email: "from@yourdomain.com", name: "From name" },
  to: [{ email: "to@example.com", name: "To name" }],
  cc: [{ email: "cc@example.com", name: "Cc name" }],
  bcc: [{ email: "bcc@example.com", name: "Bcc name" }],
  reply_to: [{ email: "reply-to@example.com", name: "Reply-To name" }],
  subject: "Hello from Helo",
  html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>",
  text: "This is a test message, delivered with <3 by Helo.",
  template: {},
  tracking: {},
  attachments: [{ content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }],
  tags: ["welcome", "onboarding"],
  headers: {},
  metadata: {}
)
Helo::Sending.send_transactional(send_message_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


## send_transactional_batch

> <SendMessageBatchResponse> send_transactional_batch(send_message_batch_request, channel_id:, idempotency_key:)

Send transactional emails in batch

Sends multiple transactional emails in a single API request for better performance.

### Example

```ruby Sending_sendTransactionalBatch
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_message_batch_request = Helo::SendMessageBatchRequest.new(
  requests: [{ to: [], cc: [], bcc: [], reply_to: [], subject: "Hello from Helo", html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>", text: "This is a test message, delivered with <3 by Helo.", template: {}, tracking: {}, attachments: [], tags: ["welcome", "onboarding"], headers: {}, metadata: {} }]
)
Helo::Sending.send_transactional_batch(send_message_batch_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


## send_broadcast

> <SendBroadcastResponse> send_broadcast(send_broadcast_request, channel_id:, idempotency_key:)

Send a broadcast

Sends a broadcast of multiple messages for marketing or announcement purposes.

### Example

```ruby Sending_sendBroadcast
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_broadcast_request = Helo::SendBroadcastRequest.new(
  from: { email: "test-email", name: "test-name" },
  reply_to: [{ email: "test-email", name: "test-name" }],
  template: {},
  tracking: {},
  attachments: [{ content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }],
  tags: ["example1", "example2"],
  headers: {},
  metadata: {},
  messages: []
)
Helo::Sending.send_broadcast(send_broadcast_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


## send_broadcast_message

> <SendMessageAcceptedResponse> send_broadcast_message(send_message_request, channel_id:, idempotency_key:)

Send a single broadcast email

Sends a single broadcast email message.

### Example

```ruby Sending_sendBroadcastMessage
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

send_message_request = Helo::SendMessageRequest.new(
  from: { email: "from@yourdomain.com", name: "From name" },
  to: [{ email: "to@example.com", name: "To name" }],
  cc: [{ email: "cc@example.com", name: "Cc name" }],
  bcc: [{ email: "bcc@example.com", name: "Bcc name" }],
  reply_to: [{ email: "reply-to@example.com", name: "Reply-To name" }],
  subject: "Hello from Helo",
  html: "<html><body><h1>Hi there, new friend.</h1><p>This is a test message, delivered with <3 by Helo. </p></body></html>",
  text: "This is a test message, delivered with <3 by Helo.",
  template: {},
  tracking: {},
  attachments: [{ content: "test-content", content_id: "test-contentId", content_type: "test-contentType", file_name: "test-fileName", disposition: Helo::AttachmentDisposition::ATTACHMENT }],
  tags: ["welcome", "onboarding"],
  headers: {},
  metadata: {}
)
Helo::Sending.send_broadcast_message(send_message_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


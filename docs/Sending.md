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
  from: Helo::MailAddress.new(email: "test-email", name: "test-name"),
  to: [],
  cc: [],
  bcc: [],
  reply_to: [],
  subject: "test-subject",
  html: "test-html",
  text: "test-text",
  template: {},
  tracking: {},
  attachments: [],
  tags: ["example1", "example2"],
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
  requests: []
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
  reply_to: [],
  template: {},
  tracking: {},
  attachments: [],
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
  from: Helo::MailAddress.new(email: "test-email", name: "test-name"),
  to: [],
  cc: [],
  bcc: [],
  reply_to: [],
  subject: "test-subject",
  html: "test-html",
  text: "test-text",
  template: {},
  tracking: {},
  attachments: [],
  tags: ["example1", "example2"],
  headers: {},
  metadata: {}
)
Helo::Sending.broadcast_message(send_message_request, channel_id: "550e8400-e29b-41d4-a716-446655440000", idempotency_key: "example")
```


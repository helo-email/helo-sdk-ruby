# Helo::SendingAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**broadcast**](SendingAPI.md#broadcast) | **POST** /send/broadcast | Send a broadcast email |
| [**broadcast_message**](SendingAPI.md#broadcast_message) | **POST** /send/broadcast/message | Send a single broadcast email |
| [**transactional**](SendingAPI.md#transactional) | **POST** /send/transactional | Send a transactional email |
| [**transactional_batch**](SendingAPI.md#transactional_batch) | **POST** /send/transactional/batch | Send transactional emails in batch |


## broadcast

> <SendBroadcastResponse> broadcast(send_broadcast_request, opts)

Send a broadcast email

Sends a broadcast email to multiple recipients for marketing or announcement purposes.

### Example

```ruby Sending_broadcast
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_broadcast_request = Helo::SendBroadcastRequest.new({ from: Helo::MailAddress.new({ email: "email_example" }), template: Helo::SendBroadcastRequestTemplate.new, messages: [ Helo::SendBroadcastRequestMessagesInner.new({ to: [ Helo::MailAddress.new({ email: "email_example" }) ] }) ] })
opts = {
  x_helo_channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d"
}
Helo::Sending.broadcast(send_broadcast_request, opts)
```

## broadcast_message

> <SendMessageAcceptedResponse> broadcast_message(send_message_request, opts)

Send a single broadcast email

Sends a single broadcast email message.

### Example

```ruby Sending_broadcastMessage
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_message_request = Helo::SendMessageRequest.new({ from: Helo::MailAddress.new({ email: "email_example" }), to: [ Helo::MailAddress.new({ email: "email_example" }) ] })
opts = {
  x_helo_channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d"
}
Helo::Sending.broadcast_message(send_message_request, opts)
```

## transactional

> <SendMessageAcceptedResponse> transactional(send_message_request, opts)

Send a transactional email

Sends a single transactional email such as receipts, confirmations, or notifications.

### Example

```ruby Sending_transactional
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_message_request = Helo::SendMessageRequest.new({ from: Helo::MailAddress.new({ email: "email_example" }), to: [ Helo::MailAddress.new({ email: "email_example" }) ] })
opts = {
  x_helo_channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d"
}
Helo::Sending.transactional(send_message_request, opts)
```

## transactional_batch

> <SendMessageBatchResponse> transactional_batch(send_message_batch_request, opts)

Send transactional emails in batch

Sends multiple transactional emails in a single API request for better performance.

### Example

```ruby Sending_transactionalBatch
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_message_batch_request = Helo::SendMessageBatchRequest.new({ requests: [ Helo::SendMessageRequest.new({ from: Helo::MailAddress.new({ email: "email_example" }), to: [ Helo::MailAddress.new({ email: "email_example" }) ] }) ] })
opts = {
  x_helo_channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d"
}
Helo::Sending.transactional_batch(send_message_batch_request, opts)
```

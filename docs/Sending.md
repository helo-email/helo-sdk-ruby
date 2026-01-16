# Helo::Sending

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**transactional**](Sending.md#transactional) | **POST** /send/transactional | Send a transactional email |
| [**transactional_batch**](Sending.md#transactional_batch) | **POST** /send/transactional/batch | Send transactional emails in batch |
| [**broadcast**](Sending.md#broadcast) | **POST** /send/broadcast | Send a broadcast email |
| [**broadcast_message**](Sending.md#broadcast_message) | **POST** /send/broadcast/message | Send a single broadcast email |


## transactional

> <SendMessageAcceptedResponse> transactional(send_message_request)

Send a transactional email

Sends a single transactional email such as receipts, confirmations, or notifications.

### Example

```ruby Sending_transactional
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_message_request = Helo::SendMessageRequest.new(
  to: []
)
Helo::Sending.transactional(send_message_request)
```


## transactional_batch

> <SendMessageBatchResponse> transactional_batch(send_message_batch_request)

Send transactional emails in batch

Sends multiple transactional emails in a single API request for better performance.

### Example

```ruby Sending_transactionalBatch
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_message_batch_request = Helo::SendMessageBatchRequest.new(
  requests: []
)
Helo::Sending.transactional_batch(send_message_batch_request)
```


## broadcast

> <SendBroadcastResponse> broadcast(send_broadcast_request)

Send a broadcast email

Sends a broadcast email to multiple recipients for marketing or announcement purposes.

### Example

```ruby Sending_broadcast
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_broadcast_request = Helo::SendBroadcastRequest.new(
  messages: []
)
Helo::Sending.broadcast(send_broadcast_request)
```


## broadcast_message

> <SendMessageAcceptedResponse> broadcast_message(send_message_request)

Send a single broadcast email

Sends a single broadcast email message.

### Example

```ruby Sending_broadcastMessage
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

send_message_request = Helo::SendMessageRequest.new(
  to: []
)
Helo::Sending.broadcast_message(send_message_request)
```


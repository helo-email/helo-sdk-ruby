# Helo::Activity

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_events**](Activity.md#list_events) | **GET** /activity/events | List activity events |
| [**list_messages**](Activity.md#list_messages) | **GET** /activity/messages | List messages |
| [**retrieve_message**](Activity.md#retrieve_message) | **GET** /activity/messages/{id} | Retrieve message details |


## list_events

> <PaginatedEventsResponse> list_events(opts)

List activity events

Retrieves activity events for messages, including delivery status, opens, clicks, bounces, unsubscribes and complaints.

### Example

```ruby Activity_listEvents
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  message_id: "550e8400-e29b-41d4-a716-446655440000",
  after: 10,
  start_date: "2024-01-01T00:00:00Z",
  end_date: "2024-01-01T00:00:00Z",
  limit: 10,
  recipient: "example",
  subject: "example",
  tags: ["example1", "example2"],
  mail_type: "transactional",
  event_types: [Helo::EventType::ACCEPTED, Helo::EventType::PROCESSED]
}
Helo::Activity.list_events(opts)
```


## list_messages

> <PaginatedMessagesResponse> list_messages(opts)

List messages

Retrieves a paginated list of sent messages with basic tracking information.

### Example

```ruby Activity_listMessages
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  after: 10,
  start_date: "2024-01-01T00:00:00Z",
  end_date: "2024-01-01T00:00:00Z",
  limit: 10,
  recipient: "example",
  subject: "example",
  tags: ["example1", "example2"],
  mail_type: "transactional",
  status: Helo::MessageStatus::QUEUED
}
Helo::Activity.list_messages(opts)
```


## retrieve_message

> <MessageDetailsResponse> retrieve_message(id)

Retrieve message details

Fetches detailed tracking information for a specific message, including all associated events.

### Example

```ruby Activity_retrieveMessage
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Activity.retrieve_message(id)
```


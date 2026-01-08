# Helo::Activity

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_events**](Activity.md#list_events) | **GET** /activity/events | List activity events |
| [**list_messages**](Activity.md#list_messages) | **GET** /activity/messages | List messages |
| [**retrieve_message**](Activity.md#retrieve_message) | **GET** /activity/messages/{id} | Retrieve message details |


## list_events

> <EventsResponse> list_events(opts)

List activity events

Retrieves activity events for messages, including delivery status, opens, clicks, bounces, and complaints.

### Example

```ruby Activity_listEvents
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "00000000-0000-0000-0000-000000000000",
  message_id: "00000000-0000-0000-0000-000000000000",
  after: 10,
  start_date: "2024-01-01T00:00:00Z",
  end_date: "2024-01-01T00:00:00Z",
  limit: 10
}
Helo::Activity.list_events(opts)
```


## list_messages

> <MessagesResponse> list_messages(opts)

List messages

Retrieves a paginated list of sent messages with basic tracking information.

### Example

```ruby Activity_listMessages
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "00000000-0000-0000-0000-000000000000",
  after: 10,
  start_date: "2024-01-01T00:00:00Z",
  end_date: "2024-01-01T00:00:00Z",
  limit: 10,
  recipient: "example",
  subject: "example",
  tag: "example",
  status: "sent"
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
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Activity.retrieve_message(id)
```


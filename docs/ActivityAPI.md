# Helo::ActivityAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_events**](ActivityAPI.md#list_events) | **GET** /activity/events | List activity events |
| [**list_messages**](ActivityAPI.md#list_messages) | **GET** /activity/messages | List messages |
| [**retrieve_message**](ActivityAPI.md#retrieve_message) | **GET** /activity/messages/{id} | Retrieve message details |


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
  channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d",
  message_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d",
  after: 789,
  start_date: Time.parse("2013-10-20T19:20:30+01:00"),
  end_date: Time.parse("2013-10-20T19:20:30+01:00"),
  limit: 56
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
  channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d",
  after: 789,
  start_date: Time.parse("2013-10-20T19:20:30+01:00"),
  end_date: Time.parse("2013-10-20T19:20:30+01:00"),
  limit: 56,
  recipient: "recipient_example",
  subject: "subject_example",
  tag: "tag_example",
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Activity.retrieve_message(id)
```

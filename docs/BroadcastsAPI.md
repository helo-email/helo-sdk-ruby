# Helo::BroadcastsAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](BroadcastsAPI.md#list) | **GET** /broadcasts | List broadcasts |
| [**list_failures**](BroadcastsAPI.md#list_failures) | **GET** /broadcasts/{id}/failures | List broadcast failures |
| [**list_suppressions**](BroadcastsAPI.md#list_suppressions) | **GET** /broadcasts/{id}/suppressions | List broadcast suppressions |
| [**retrieve**](BroadcastsAPI.md#retrieve) | **GET** /broadcasts/{id} | Retrieve a broadcast |


## list

> <PaginatedResponseOfBroadcast> list(channel_id, opts)

List broadcasts

Retrieves a paginated list of sent broadcasts with summary statistics.

### Example

```ruby Broadcasts_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

channel_id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
opts = {
  status: Helo::BroadcastStatus::ACCEPTED,
  subject: "subject_example",
  limit: 56,
  offset: 56
}
Helo::Broadcasts.list(channel_id, opts)
```

## list_failures

> <PaginatedResponseOfBroadcastFailure> list_failures(id)

List broadcast failures

Retrieves a list of failed messages for a specific broadcast.

### Example

```ruby Broadcasts_listFailures
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Broadcasts.list_failures(id)
```

## list_suppressions

> <PaginatedResponseOfBroadcastSuppression> list_suppressions(id)

List broadcast suppressions

Retrieves a list of suppressed recipients for a specific broadcast.

### Example

```ruby Broadcasts_listSuppressions
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Broadcasts.list_suppressions(id)
```

## retrieve

> <BroadcastDetailsResponse> retrieve(id)

Retrieve a broadcast

Fetches details and statistics for a specific broadcast.

### Example

```ruby Broadcasts_retrieve
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Broadcasts.retrieve(id)
```

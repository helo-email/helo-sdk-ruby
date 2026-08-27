# Helo::Broadcasts

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Broadcasts.md#list) | **GET** /broadcasts | List broadcasts |
| [**retrieve**](Broadcasts.md#retrieve) | **GET** /broadcasts/{id} | Retrieve a broadcast |
| [**list_failures**](Broadcasts.md#list_failures) | **GET** /broadcasts/{id}/failures | List failed broadcast messages |
| [**list_suppressions**](Broadcasts.md#list_suppressions) | **GET** /broadcasts/{id}/suppressions | List broadcast suppressed recipients |


## list

> <PaginatedResponseOfBroadcast> list(opts)

List broadcasts

Retrieves a paginated list of sent broadcasts with summary statistics.

### Example

```ruby Broadcasts_list
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  status: Helo::BroadcastStatus::ACCEPTED,
  subject: "example",
  limit: 10,
  offset: 10
}
Helo::Broadcasts.list(opts)
```


## retrieve

> <BroadcastDetailsResponse> retrieve(id)

Retrieve a broadcast

Fetches details and statistics for a specific broadcast.

### Example

```ruby Broadcasts_retrieve
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Broadcasts.retrieve(id)
```


## list_failures

> <PaginatedResponseOfBroadcastFailure> list_failures(id, opts)

List failed broadcast messages

Returns messages that could not be delivered due to permanent errors (e.g. invalid addresses, domain issues). Transient errors that were retried successfully do not appear here.

### Example

```ruby Broadcasts_listFailures
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
opts = {
  limit: 10,
  offset: 10
}
Helo::Broadcasts.list_failures(id, opts)
```


## list_suppressions

> <PaginatedResponseOfBroadcastSuppression> list_suppressions(id, opts)

List broadcast suppressed recipients

Returns recipients that were skipped because they appear on a suppression list (e.g. previous bounces or unsubscribes).

### Example

```ruby Broadcasts_listSuppressions
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
opts = {
  limit: 10,
  offset: 10
}
Helo::Broadcasts.list_suppressions(id, opts)
```


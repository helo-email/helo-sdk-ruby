# Helo::Broadcasts

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Broadcasts.md#list) | **GET** /broadcasts | List broadcasts |
| [**retrieve**](Broadcasts.md#retrieve) | **GET** /broadcasts/{id} | Retrieve a broadcast |
| [**list_failures**](Broadcasts.md#list_failures) | **GET** /broadcasts/{id}/failures | List broadcast failures |
| [**list_suppressions**](Broadcasts.md#list_suppressions) | **GET** /broadcasts/{id}/suppressions | List broadcast suppressions |


## list

> <PaginatedResponseOfBroadcastResponse> list(opts)

List broadcasts

Retrieves a paginated list of sent broadcasts with summary statistics.

### Example

```ruby Broadcasts_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "00000000-0000-0000-0000-000000000000",
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
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Broadcasts.retrieve(id)
```


## list_failures

> <BroadcastFailuresResponse> list_failures(id)

List broadcast failures

Retrieves a list of failed messages for a specific broadcast.

### Example

```ruby Broadcasts_listFailures
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Broadcasts.list_failures(id)
```


## list_suppressions

> <BroadcastSuppressionsResponse> list_suppressions(id)

List broadcast suppressions

Retrieves a list of suppressed recipients for a specific broadcast.

### Example

```ruby Broadcasts_listSuppressions
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Broadcasts.list_suppressions(id)
```


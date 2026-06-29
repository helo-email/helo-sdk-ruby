# Helo::Webhooks

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_for_channel**](Webhooks.md#list_for_channel) | **GET** /app/channels/{id}/webhooks | List_for_channel operation |
| [**list**](Webhooks.md#list) | **GET** /webhooks | List operation |
| [**create**](Webhooks.md#create) | **POST** /webhooks | Create operation |
| [**retrieve**](Webhooks.md#retrieve) | **GET** /webhooks/{id} | Retrieve operation |
| [**update**](Webhooks.md#update) | **PATCH** /webhooks/{id} | Update operation |
| [**delete**](Webhooks.md#delete) | **DELETE** /webhooks/{id} | Delete operation |
| [**regenerate_signing_key**](Webhooks.md#regenerate_signing_key) | **POST** /webhooks/{id}/regenerate-signing-key | Regenerate_signing_key operation |


## list_for_channel

> <WebhooksResponse> list_for_channel(id)

List_for_channel operation

Retrieve all webhooks applicable to a specific channel.

### Example

```ruby Webhooks_listForChannel
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Webhooks.list_for_channel(id)
```


## list

> <PaginationResultOfWebhookResponse> list(opts)

List operation

List webhooks.

### Example

```ruby Webhooks_list
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

opts = {
  limit: 10,
  offset: 10,
  channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"]
}
Helo::Webhooks.list(opts)
```


## create

> <WebhookResponse> create(create_webhook_request)

Create operation

Create a new webhook.

### Example

```ruby Webhooks_create
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

create_webhook_request = Helo::CreateWebhookRequest.new(
  url: "test-url",
  events: ["accepted", "processed"],
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  additional_headers: [],
  enabled: true
)
Helo::Webhooks.create(create_webhook_request)
```


## retrieve

> <WebhookResponse> retrieve(id)

Retrieve operation

Retrieve a single webhook by ID.

### Example

```ruby Webhooks_retrieve
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Webhooks.retrieve(id)
```


## update

> <WebhookResponse> update(id, update_webhook_request)

Update operation

Update an existing webhook.

### Example

```ruby Webhooks_update
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
update_webhook_request = Helo::UpdateWebhookRequest.new(
  url: "test-url",
  events: ["accepted", "processed"],
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  additional_headers: [],
  enabled: true
)
Helo::Webhooks.update(id, update_webhook_request)
```


## delete

> delete(id)

Delete operation

Delete a webhook by ID.

### Example

```ruby Webhooks_delete
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Webhooks.delete(id)
```


## regenerate_signing_key

> <WebhookResponse> regenerate_signing_key(id)

Regenerate_signing_key operation

Regenerate the signing key used for the webhook signature. This operation replaces the old key.

### Example

```ruby Webhooks_regenerateSigningKey
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Webhooks.regenerate_signing_key(id)
```


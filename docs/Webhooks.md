# Helo::Webhooks

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Webhooks.md#list) | **GET** /webhooks | List all webhooks |
| [**create**](Webhooks.md#create) | **POST** /webhooks | Create a webhook |
| [**retrieve**](Webhooks.md#retrieve) | **GET** /webhooks/{id} | Retrieve a webhook |
| [**update**](Webhooks.md#update) | **PATCH** /webhooks/{id} | Update a webhook |
| [**delete**](Webhooks.md#delete) | **DELETE** /webhooks/{id} | Delete a webhook |
| [**regenerate_signing_key**](Webhooks.md#regenerate_signing_key) | **POST** /webhooks/{id}/regenerate-signing-key | Regenerate webhook signing key |


## list

> <PaginationResultOfWebhookResponse> list(opts)

List all webhooks

Retrieves all webhooks configured for the account.

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

Create a webhook

Registers a new webhook to receive event notifications.

### Example

```ruby Webhooks_create
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

create_webhook_request = Helo::CreateWebhookRequest.new(
  url: "test-url",
  events: [Helo::WebhookEvent::MESSAGE_ACCEPTED, Helo::WebhookEvent::MESSAGE_PROCESSED],
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  additional_headers: [Helo::WebhookHeader.new(name: "test-name", value: "test-value")],
  enabled: true
)
Helo::Webhooks.create(create_webhook_request)
```


## retrieve

> <WebhookResponse> retrieve(id)

Retrieve a webhook

Fetches the details and configuration of a specific webhook.

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

Update a webhook

Modifies an existing webhook by ID.

### Example

```ruby Webhooks_update
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
update_webhook_request = Helo::UpdateWebhookRequest.new(
  url: "test-url",
  events: [Helo::WebhookEvent::MESSAGE_ACCEPTED, Helo::WebhookEvent::MESSAGE_PROCESSED],
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  additional_headers: [Helo::WebhookHeader.new(name: "test-name", value: "test-value")],
  enabled: true
)
Helo::Webhooks.update(id, update_webhook_request)
```


## delete

> delete(id)

Delete a webhook

Permanently removes a webhook.

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

Regenerate webhook signing key

Regenerate the signing key used for the webhook signature. This operation replaces the old key.

### Example

```ruby Webhooks_regenerateSigningKey
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Webhooks.regenerate_signing_key(id)
```


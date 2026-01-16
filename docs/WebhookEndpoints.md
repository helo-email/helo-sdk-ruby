# Helo::WebhookEndpoints

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](WebhookEndpoints.md#list) | **GET** /webhook-endpoints | List all webhook endpoints |
| [**create**](WebhookEndpoints.md#create) | **POST** /webhook-endpoints | Create a webhook endpoint |
| [**retrieve**](WebhookEndpoints.md#retrieve) | **GET** /webhook-endpoints/{id} | Retrieve a webhook endpoint |
| [**update**](WebhookEndpoints.md#update) | **PATCH** /webhook-endpoints/{id} | Update a webhook endpoint |
| [**delete**](WebhookEndpoints.md#delete) | **DELETE** /webhook-endpoints/{id} | Delete a webhook endpoint |
| [**regenerate_signing_key**](WebhookEndpoints.md#regenerate_signing_key) | **POST** /webhook-endpoints/{id}/regenerate-signing-key | Regenerate webhook signing key |


## list

> <PaginationResultOfWebhookEndpointResponse> list(opts)

List all webhook endpoints

Retrieves all webhook endpoints configured for the account.

### Example

```ruby WebhookEndpoints_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  limit: 10,
  offset: 10,
  channel_ids: ["00000000-0000-0000-0000-000000000000", "11111111-1111-1111-1111-111111111111"]
}
Helo::WebhookEndpoints.list(opts)
```


## create

> <WebhookEndpointResponse> create(create_webhook_endpoint_request)

Create a webhook endpoint

Registers a new webhook endpoint to receive event notifications.

### Example

```ruby WebhookEndpoints_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_webhook_endpoint_request = Helo::CreateWebhookEndpointRequest.new(
  url: "test-url",
  events: []
)
Helo::WebhookEndpoints.create(create_webhook_endpoint_request)
```


## retrieve

> <WebhookEndpointResponse> retrieve(id)

Retrieve a webhook endpoint

Fetches the details and configuration of a specific webhook endpoint.

### Example

```ruby WebhookEndpoints_retrieve
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::WebhookEndpoints.retrieve(id)
```


## update

> <WebhookEndpointResponse> update(id, update_webhook_endpoint_request)

Update a webhook endpoint

Modifies the configuration of an existing webhook endpoint.

### Example

```ruby WebhookEndpoints_update
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
update_webhook_endpoint_request = Helo::UpdateWebhookEndpointRequest.new(
  url: "test-url",
  events: [],
  channel_id: "00000000-0000-0000-0000-000000000000",
  additional_headers: [],
  enabled: true
)
Helo::WebhookEndpoints.update(id, update_webhook_endpoint_request)
```


## delete

> delete(id)

Delete a webhook endpoint

Permanently removes a webhook endpoint.

### Example

```ruby WebhookEndpoints_delete
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::WebhookEndpoints.delete(id)
```


## regenerate_signing_key

> <WebhookEndpointResponse> regenerate_signing_key(id)

Regenerate webhook signing key

Generates a new signing key for webhook payload verification.

### Example

```ruby WebhookEndpoints_regenerateSigningKey
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::WebhookEndpoints.regenerate_signing_key(id)
```


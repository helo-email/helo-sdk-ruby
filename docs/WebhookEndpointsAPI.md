# Helo::WebhookEndpointsAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create**](WebhookEndpointsAPI.md#create) | **POST** /webhook-endpoints | Create a webhook endpoint |
| [**delete**](WebhookEndpointsAPI.md#delete) | **DELETE** /webhook-endpoints/{id} | Delete a webhook endpoint |
| [**list**](WebhookEndpointsAPI.md#list) | **GET** /webhook-endpoints | List all webhook endpoints |
| [**regenerate_signing_key**](WebhookEndpointsAPI.md#regenerate_signing_key) | **POST** /webhook-endpoints/{id}/regenerate-signing-key | Regenerate webhook signing key |
| [**retrieve**](WebhookEndpointsAPI.md#retrieve) | **GET** /webhook-endpoints/{id} | Retrieve a webhook endpoint |
| [**update**](WebhookEndpointsAPI.md#update) | **PATCH** /webhook-endpoints/{id} | Update a webhook endpoint |


## create

> <WebhookEndpointResponse> create(create_webhook_endpoint_request)

Create a webhook endpoint

Registers a new webhook endpoint to receive event notifications.

### Example

```ruby WebhookEndpoints_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_webhook_endpoint_request = Helo::CreateWebhookEndpointRequest.new({ url: "url_example", events: [ Helo::WebhookEvent::ACCEPTED ] })
Helo::WebhookEndpoints.create(create_webhook_endpoint_request)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::WebhookEndpoints.delete(id)
```

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
  limit: 56,
  offset: 56,
  channel_ids: [ "inner_example" ]
}
Helo::WebhookEndpoints.list(opts)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::WebhookEndpoints.regenerate_signing_key(id)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
update_webhook_endpoint_request = Helo::UpdateWebhookEndpointRequest.new
Helo::WebhookEndpoints.update(id, update_webhook_endpoint_request)
```

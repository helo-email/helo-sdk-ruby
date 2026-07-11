# Helo::Channels

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Channels.md#list) | **GET** /channels | List all channels |
| [**create**](Channels.md#create) | **POST** /channels | Create a channel |
| [**retrieve**](Channels.md#retrieve) | **GET** /channels/{id} | Retrieve a channel |
| [**update**](Channels.md#update) | **PATCH** /channels/{id} | Update a channel |
| [**delete**](Channels.md#delete) | **DELETE** /channels/{id} | Delete a channel |


## list

> <PaginationResultOfChannelBasicResponse> list(opts)

List all channels

Retrieves a list of all channels accessible to the current user.

### Example

```ruby Channels_list
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

opts = {
  limit: 10,
  offset: 10,
  name: "example",
  channel_ids: ["550e8400-e29b-41d4-a716-446655440000", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"],
  delivery_type: "live"
}
Helo::Channels.list(opts)
```


## create

> <ChannelDetailsResponse> create(create_channel_request)

Create a channel

Creates a new communication channel for organizing and routing messages.

### Example

```ruby Channels_create
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

create_channel_request = Helo::CreateChannelRequest.new(
  name: "test-name",
  delivery_type: Helo::DeliveryType::LIVE,
  tracking: Helo::CreateChannelTracking.new(links: true, opens: true)
)
Helo::Channels.create(create_channel_request)
```


## retrieve

> <ChannelDetailsResponse> retrieve(id)

Retrieve a channel

Fetches the details and configuration of a specific channel.

### Example

```ruby Channels_retrieve
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Channels.retrieve(id)
```


## update

> <ChannelDetailsResponse> update(id, update_channel_request)

Update a channel

Modifies an existing channel by ID.

### Example

```ruby Channels_update
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
update_channel_request = Helo::UpdateChannelRequest.new(
  name: "test-name",
  delivery_type: Helo::DeliveryType::LIVE,
  tracking: Helo::UpdateChannelTracking.new(links: true, opens: true)
)
Helo::Channels.update(id, update_channel_request)
```


## delete

> delete(id)

Delete a channel

Permanently removes a channel and all associated data.

### Example

```ruby Channels_delete
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end

id = "550e8400-e29b-41d4-a716-446655440000"
Helo::Channels.delete(id)
```


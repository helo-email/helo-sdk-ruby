# Helo::Channels

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Channels.md#list) | **GET** /channels | List all channels |
| [**create**](Channels.md#create) | **POST** /channels | Create a channel |
| [**retrieve**](Channels.md#retrieve) | **GET** /channels/{id} | Retrieve a channel |
| [**update**](Channels.md#update) | **PATCH** /channels/{id} | Update a channel |
| [**delete**](Channels.md#delete) | **DELETE** /channels/{id} | Delete a channel |


## list

> <PaginationResultOfChannelResponse> list(opts)

List all channels

Retrieves a list of all channels accessible to the current user.

### Example

```ruby Channels_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  limit: 10,
  offset: 10,
  name: "example",
  channel_ids: ["00000000-0000-0000-0000-000000000000", "11111111-1111-1111-1111-111111111111"],
  delivery_type: "live"
}
Helo::Channels.list(opts)
```


## create

> <ChannelResponse> create(create_channel_request)

Create a channel

Creates a new communication channel for organizing and routing messages.

### Example

```ruby Channels_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_channel_request = Helo::CreateChannelRequest.new(
  name: "test-name",
  delivery_type: Helo::DeliveryType::LIVE
)
Helo::Channels.create(create_channel_request)
```


## retrieve

> <ChannelResponse> retrieve(id)

Retrieve a channel

Fetches the details and configuration of a specific channel.

### Example

```ruby Channels_retrieve
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Channels.retrieve(id)
```


## update

> <ChannelResponse> update(id, update_channel_request)

Update a channel

Modifies the settings and configuration of an existing channel.

### Example

```ruby Channels_update
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
update_channel_request = Helo::UpdateChannelRequest.new(
  name: "test-name",
  delivery_type: Helo::DeliveryType::LIVE,
  track_links: true,
  track_opens: true
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
  config.access_token = "YOUR_BEARER_TOKEN"
end

id = "00000000-0000-0000-0000-000000000000"
Helo::Channels.delete(id)
```


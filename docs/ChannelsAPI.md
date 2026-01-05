# Helo::ChannelsAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create**](ChannelsAPI.md#create) | **POST** /channels | Create a channel |
| [**delete**](ChannelsAPI.md#delete) | **DELETE** /channels/{id} | Delete a channel |
| [**list**](ChannelsAPI.md#list) | **GET** /channels | List all channels |
| [**retrieve**](ChannelsAPI.md#retrieve) | **GET** /channels/{id} | Retrieve a channel |
| [**update**](ChannelsAPI.md#update) | **PATCH** /channels/{id} | Update a channel |


## create

> <ChannelResponse> create(create_channel_request)

Create a channel

Creates a new communication channel for organizing and routing messages.

### Example

```ruby Channels_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_channel_request = Helo::CreateChannelRequest.new({ name: "name_example", delivery_type: Helo::DeliveryType::LIVE })
Helo::Channels.create(create_channel_request)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
Helo::Channels.delete(id)
```

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
  limit: 56,
  offset: 56,
  name: "name_example",
  channel_ids: [ "inner_example" ],
  delivery_type: "live"
}
Helo::Channels.list(opts)
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
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

id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
update_channel_request = Helo::UpdateChannelRequest.new
Helo::Channels.update(id, update_channel_request)
```

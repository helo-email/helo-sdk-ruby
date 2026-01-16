# Helo::Suppressions

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list**](Suppressions.md#list) | **GET** /suppressions | List suppressions |
| [**create**](Suppressions.md#create) | **POST** /suppressions | Create suppressions |
| [**remove**](Suppressions.md#remove) | **POST** /suppressions/remove | Remove suppressions |


## list

> <PaginatedResponseOfSuppressionResponse> list(opts)

List suppressions

Retrieves a list of suppressed email addresses for a channel.

### Example

```ruby Suppressions_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  email: "example",
  limit: 10,
  offset: 10
}
Helo::Suppressions.list(opts)
```


## create

> <CreateSuppressionsResponse> create(create_suppressions_request)

Create suppressions

Adds email addresses to the suppression list to prevent future sends.

### Example

```ruby Suppressions_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_suppressions_request = Helo::CreateSuppressionsRequest.new(
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  mail_type: Helo::MailType::TRANSACTIONAL,
  emails: ["example1", "example2"]
)
Helo::Suppressions.create(create_suppressions_request)
```


## remove

> <RemoveSuppressionsResponse> remove(remove_suppressions_request)

Remove suppressions

Removes email addresses from the suppression list to allow future sends.

### Example

```ruby Suppressions_remove
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

remove_suppressions_request = Helo::RemoveSuppressionsRequest.new(
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  mail_type: Helo::MailType::TRANSACTIONAL,
  emails: ["example1", "example2"]
)
Helo::Suppressions.remove(remove_suppressions_request)
```


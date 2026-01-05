# Helo::SuppressionsAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create**](SuppressionsAPI.md#create) | **POST** /suppressions | Create suppressions |
| [**list**](SuppressionsAPI.md#list) | **GET** /suppressions | List suppressions |
| [**remove**](SuppressionsAPI.md#remove) | **POST** /suppressions/remove | Remove suppressions |


## create

> <CreateSuppressionsResponse> create(create_suppressions_request)

Create suppressions

Adds email addresses to the suppression list to prevent future sends.

### Example

```ruby Suppressions_create
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

create_suppressions_request = Helo::CreateSuppressionsRequest.new({ channel_id: "channel_id_example", mail_type: Helo::MailType::TRANSACTIONAL, emails: [ "emails_example" ] })
Helo::Suppressions.create(create_suppressions_request)
```

## list

> <PaginatedResponseOfSuppressionResponse> list(channel_id, mail_type, opts)

List suppressions

Retrieves a list of suppressed email addresses for a channel.

### Example

```ruby Suppressions_list
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

channel_id = "38400000-8cf0-11bd-b23e-10b96e4ef00d"
mail_type = Helo::MailType::TRANSACTIONAL
opts = {
  reason: Helo::SuppressionReason::BOUNCE,
  email: "email_example",
  limit: 56,
  offset: 56
}
Helo::Suppressions.list(channel_id, mail_type, opts)
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

remove_suppressions_request = Helo::RemoveSuppressionsRequest.new({ channel_id: "channel_id_example", mail_type: Helo::MailType::TRANSACTIONAL, emails: [ "emails_example" ] })
Helo::Suppressions.remove(remove_suppressions_request)
```

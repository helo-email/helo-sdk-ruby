# Helo Ruby SDK

The official Ruby SDK for the [Helo](https://helohq.com) email API. Send transactional and broadcast emails, manage domains and channels, query activity and statistics, and configure webhooks and suppressions.

## Requirements

- Ruby >= 3.2.0

## Installation

Add the gem to your `Gemfile`:

```ruby
gem "helo-ruby"
```

Then run:

```sh
bundle install
```

Or install it directly:

```sh
gem install helo-ruby
```

## Configuration

Configure the SDK once during your application's boot process. The API key is read from your Helo dashboard — keep it in an environment variable rather than committing it to source control.

```ruby
require "helo"

Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
end
```

### Configuration options

| Option     | Default                     | Description                                  |
| ---------- | --------------------------- | -------------------------------------------- |
| `api_key`  | `nil`                       | Your Helo API key. Sent as a Bearer token.   |
| `base_url` | `https://api.helohq.com`    | API base URL. Override for testing/staging.  |

The `api_key` may also be a callable (anything responding to `call`), which is resolved on every request — useful for rotating or dynamically-fetched keys:

```ruby
Helo.configure do |config|
  config.api_key = -> { MyTokenStore.current_helo_key }
end
```

### Customizing the HTTP connection

The SDK uses [Faraday](https://lostisland.github.io/faraday/) under the hood. You can hook into the connection to add middleware, timeouts, or logging:

```ruby
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
  config.configure_faraday_connection do |conn|
    conn.options.timeout = 10
    conn.options.open_timeout = 5
  end
end
```

## Usage

API resources are exposed as classes under the `Helo` namespace, each with class-level methods that use the client configured via `Helo.configure`.

### Send a transactional email

```ruby
request = Helo::SendMessageRequest.new(
  from: Helo::MailAddress.new(email: "hello@yourdomain.com", name: "Your App"),
  to: [Helo::MailAddress.new(email: "customer@example.com", name: "Customer")],
  subject: "Welcome aboard!",
  html: "<h1>Thanks for signing up</h1>",
  text: "Thanks for signing up",
  tags: ["welcome"]
)

response = Helo::Sending.transactional(
  request,
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  idempotency_key: "welcome-customer-123"
)
```

The optional `idempotency_key` lets you safely retry a send without delivering the same message twice.

### Send a batch of transactional emails

```ruby
batch = Helo::SendMessageBatchRequest.new(
  requests: [request_one, request_two]
)

Helo::Sending.transactional_batch(batch, channel_id: channel_id)
```

### List and retrieve resources

```ruby
# List domains with pagination and filters
domains = Helo::Domains.list(limit: 10, offset: 0, name: "example")

# Retrieve a single domain
domain = Helo::Domains.retrieve("550e8400-e29b-41d4-a716-446655440000")

# Create a domain
created = Helo::Domains.create(
  Helo::CreateDomainRequest.new(name: "yourdomain.com")
)

# Verify a domain's DNS records
Helo::Domains.verify(domain.id)
```

## Available resources

| Resource                  | Description                                              | Docs                              |
| ------------------------- | -------------------------------------------------------- | --------------------------------- |
| `Helo::Sending`           | Send transactional and broadcast emails                  | [Sending](docs/Sending.md)        |
| `Helo::Broadcasts`        | Manage broadcasts, failures, and suppressions            | [Broadcasts](docs/Broadcasts.md)  |
| `Helo::Channels`          | Manage sending channels                                  | [Channels](docs/Channels.md)      |
| `Helo::Domains`           | Register, verify, and manage sending domains             | [Domains](docs/Domains.md)        |
| `Helo::Activity`          | Query message and event activity                         | [Activity](docs/Activity.md)      |
| `Helo::Statistics`        | Retrieve delivery totals and hourly/daily statistics     | [Statistics](docs/Statistics.md)  |
| `Helo::Suppressions`      | Manage the suppression list                              | [Suppressions](docs/Suppressions.md) |
| `Helo::WebhookEndpoints`  | Create and manage webhook endpoints                      | [WebhookEndpoints](docs/WebhookEndpoints.md) |

See the [`docs/`](docs) directory for the full method reference and per-method examples.

## Error handling

Any non-2xx response, or a connection/timeout failure, raises a `Helo::APIError`. The exception carries the HTTP status code, response body, and headers, plus helpers for reading structured error details.

```ruby
begin
  Helo::Sending.transactional(request, channel_id: channel_id)
rescue Helo::APIError => e
  e.code     # => HTTP status code, e.g. 422
  e.detail   # => human-readable error detail from the response
  e.errors   # => hash of field-level validation errors, when present
  e.message  # => full message including status, headers, and body
end
```

## Development

After checking out the repo, install dependencies and run the test suite:

```sh
bundle install
bundle exec rake test
```

## License

This SDK is released under the [MIT License](LICENSE.txt).

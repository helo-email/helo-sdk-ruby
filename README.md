# helo-email-sdk

Helo API

## Installation

Add the gem to your Gemfile:

```ruby
gem "helo-email-sdk"
```

Then run:

```bash
bundle install
```

## Configuration

Configure the SDK once, at boot:

```ruby
require "helo-email-sdk"

Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
  config.base_url = "https://api.helohq.com" # optional, this is the default
end
```

## Usage

Each API is a class with class-level methods. Responses come back as model objects with
typed attribute readers.

```ruby
result = Helo::Channels.list
```

Methods that take parameters accept a hash:

```ruby
result = Helo::Channels.list(limit: 10)
```

See the [API docs](#apis) for every method, with a runnable example each.

### Errors

Failed requests raise `Helo::APIError`:

```ruby
begin
  Helo::Channels.list
rescue Helo::APIError => e
  e.code    # HTTP status
  e.detail  # human-readable detail from the API
  e.errors  # field-level validation errors, when present
end
```

## Webhook signature verification

Webhook deliveries are signed with the endpoint's signing key. Verify every delivery before
acting on it, against the **raw** request body — parsing and re-serializing the JSON changes
the bytes and the signature will not match.

```ruby
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Helo::WebhookSignatures.verify!(
      request.headers["X-Helo-Webhook-Signature"],
      request.raw_post, # raw body, exactly as received
      ENV.fetch("HELO_WEBHOOK_SIGNING_KEY")
    )

    event = JSON.parse(request.raw_post)
    # ... handle the event, then acknowledge quickly
    head :no_content
  rescue Helo::WebhookSignatures::Error
    head :bad_request
  end
end
```

`verify!` returns `true` when the signature is valid and raises otherwise. Each rejection has
its own class, so a stale delivery can be treated differently from a genuinely bad one:

| Exception | Meaning |
| --- | --- |
| `MalformedHeaderError` | The header was not in the expected format |
| `UnsupportedVersionError` | The delivery used a signing scheme this SDK version cannot verify — upgrade the gem |
| `TimestampSkewError` | Correctly signed, but too old to accept — possible replay, or clock drift |
| `SignatureMismatchError` | Wrong signing key, or the body was modified in transit |

All four inherit from `Helo::WebhookSignatures::Error`, so `rescue` that one class
to catch any rejection. If you only want a boolean, use `valid?` instead:

```ruby
if Helo::WebhookSignatures.valid?(signature_header, raw_body, signing_key)
  # ...
end
```

The signature header may carry several versions at once (`t=...,v1=...,v2=...`) while a new
signing scheme is being rolled out. This SDK verifies against the newest version it supports
(`SUPPORTED_VERSIONS`) and ignores elements it does not recognize, so a rollout will not break
this integration.

To compute a signature yourself — signing a fixture in tests, for example — use
`Helo::WebhookSignatures.generate(payload, signing_key, timestamp)`.

## APIs

- [Helo::Channels](docs/Channels.md)
- [Helo::Activity](docs/Activity.md)
- [Helo::Domains](docs/Domains.md)
- [Helo::Sending](docs/Sending.md)
- [Helo::Broadcasts](docs/Broadcasts.md)
- [Helo::Statistics](docs/Statistics.md)
- [Helo::Suppressions](docs/Suppressions.md)
- [Helo::Webhooks](docs/Webhooks.md)

# helo-email-sdk

Helo Email API (https://helohq.com)

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
end
```

## Automatic retries

A request that fails with a network error, a timeout, or a `408`, `429`, `500`, `502`, `503` or
`504` response is retried up to 2 times, with exponential backoff and full jitter. It
is only retried when sending it again can't do anything twice: a `GET`, `PUT` or `DELETE`,
or a request carrying an idempotency key. A `429` is always retried, since the server
refused the request without acting on it. A `Retry-After` header is honoured; one asking
for more than 8 seconds is not retried early, and the error is returned instead.

Operations that take an idempotency key generate one for each call when you don't pass
one, and send it on every retry, so a send whose response was lost is never sent twice.
Pass your own key to make your own retries (a background job run again, say) safe too.

Set `config.max_retries` to change how many, or to `0` to disable them:

```ruby
Helo.configure do |config|
  config.api_key = ENV.fetch("HELO_API_KEY")
  config.max_retries = 0
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

## Rails (ActionMailer)

The gem registers a `:helo` delivery method with ActionMailer, so existing
mailers send through the API without any changes. Configure the SDK in an initializer:

```ruby
# config/initializers/helo.rb
Helo.configure do |config|
  config.api_key = Rails.application.credentials.helo_api_key
end
```

and switch the delivery method:

```ruby
# config/environments/production.rb
config.action_mailer.delivery_method = :helo
```

Plain ActionMailer fields map to the API: `from`, `to`, `cc`, `bcc`, `reply_to`, `subject`, the
text and HTML parts, attachments (`attachments.inline` ones keep their content id, so
`image_tag attachments["logo.png"].url` works), and any custom headers. API-specific options go
in `delivery_method_options`, which other delivery methods (`:test`, letter_opener, SMTP) ignore:

```ruby
class UserMailer < ApplicationMailer
  def welcome(user)
    headers["X-Custom-Header"] = "value" # custom headers are sent as-is
    mail(
      to: user.email,
      subject: "Welcome!",
      delivery_method_options: {
        tags: ["welcome"],
        metadata: { user_id: user.id.to_s },
        tracking: { opens: true, links: false },
        idempotency_key: "welcome-#{user.id}", # retries won't send twice
        channel_id: "..."
      }
    )
  end
end
```

After delivery, `message[:helo_message_id].value` is the id the API assigned the
message, and failed requests raise `Helo::APIError` (subject to `config.action_mailer.raise_delivery_errors`).

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
- [Helo::Templates](docs/Templates.md)
- [Helo::Webhooks](docs/Webhooks.md)

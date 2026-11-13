# Changelog

## 1.4.0

- Added automatic retries. A request that fails with a network error, a timeout, or a
  `408`, `429` or `5xx` response is retried up to 2 times with backoff, but only when sending it
  again can't do anything twice. Set `config.max_retries` to change how many, or `0` to disable
  them.
- `send_transactional`, `send_transactional_batch`, `send_broadcast` and
  `send_broadcast_message` now generate an idempotency key when you don't pass
  `idempotency_key`, and send the same key on every retry, so a send whose response was lost is
  never sent twice.

## 1.3.0

- Added `Helo::ConnectionError`, raised when the API can't be reached (the
  connection failed or timed out). It's a subclass of `Helo::APIError`, so
  existing `rescue Helo::APIError` still catches it.
- Improved the documentation of the template methods, including MJML support.

## 1.2.0

- Added sending template management
- Added support for custom tracking domains

## 1.1.0

- Added `Helo::Mailer`, an ActionMailer delivery method registered as `:helo` in Rails apps.
- Added `id` to the `template` of `send_transactional` and `send_broadcast`, to send a stored template
  instead of an inline `subject`, `html` and `text`.

## 1.0.1

- Release pipeline updates

## 1.0.0

- Initial release

# Changelog

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

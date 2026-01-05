# Helo::StatisticsAPI

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**retrieve_daily**](StatisticsAPI.md#retrieve_daily) | **GET** /activity/statistics/daily | Retrieve daily statistics |
| [**retrieve_hourly**](StatisticsAPI.md#retrieve_hourly) | **GET** /activity/statistics/hourly | Retrieve hourly statistics |
| [**retrieve_totals**](StatisticsAPI.md#retrieve_totals) | **GET** /activity/statistics/totals | Retrieve all time statistics |


## retrieve_daily

> <StatisticsResponse> retrieve_daily(from, to, timezone, opts)

Retrieve daily statistics

Fetches daily aggregated statistics.

### Example

```ruby Statistics_retrieveDaily
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

from = Time.parse("2013-10-20T19:20:30+01:00")
to = Time.parse("2013-10-20T19:20:30+01:00")
timezone = "timezone_example"
opts = {
  channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d",
  tag: "tag_example"
}
Helo::Statistics.retrieve_daily(from, to, timezone, opts)
```

## retrieve_hourly

> <StatisticsResponse> retrieve_hourly(from, to, opts)

Retrieve hourly statistics

Fetches hourly aggregated statistics.

### Example

```ruby Statistics_retrieveHourly
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

from = Time.parse("2013-10-20T19:20:30+01:00")
to = Time.parse("2013-10-20T19:20:30+01:00")
opts = {
  channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d",
  tag: "tag_example"
}
Helo::Statistics.retrieve_hourly(from, to, opts)
```

## retrieve_totals

> <StatisticsTotalsResponse> retrieve_totals(from, to, opts)

Retrieve all time statistics

Fetches cumulative statistics.

### Example

```ruby Statistics_retrieveTotals
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

from = Time.parse("2013-10-20T19:20:30+01:00")
to = Time.parse("2013-10-20T19:20:30+01:00")
opts = {
  channel_id: "38400000-8cf0-11bd-b23e-10b96e4ef00d",
  tag: "tag_example"
}
Helo::Statistics.retrieve_totals(from, to, opts)
```

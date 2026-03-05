# Helo::Statistics

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**retrieve_hourly**](Statistics.md#retrieve_hourly) | **GET** /activity/statistics/hourly | Retrieve hourly statistics |
| [**retrieve_daily**](Statistics.md#retrieve_daily) | **GET** /activity/statistics/daily | Retrieve daily statistics |
| [**retrieve_totals**](Statistics.md#retrieve_totals) | **GET** /activity/statistics/totals | Retrieve all time statistics |


## retrieve_hourly

> <StatisticsHourlyResponse> retrieve_hourly(opts)

Retrieve hourly statistics

Fetches hourly aggregated statistics.

### Example

```ruby Statistics_retrieveHourly
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  from: "2024-01-01T00:00:00Z",
  to: "2024-01-01T00:00:00Z",
  tag: "example"
}
Helo::Statistics.retrieve_hourly(opts)
```


## retrieve_daily

> <StatisticsDailyResponse> retrieve_daily(opts)

Retrieve daily statistics

Fetches daily aggregated statistics.

### Example

```ruby Statistics_retrieveDaily
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  from: "2024-01-01",
  to: "2024-01-01",
  tag: "example",
  timezone: "example"
}
Helo::Statistics.retrieve_daily(opts)
```


## retrieve_totals

> <StatisticsTotalsResponse> retrieve_totals(opts)

Retrieve all time statistics

Fetches cumulative statistics.

### Example

```ruby Statistics_retrieveTotals
Helo.configure do |config|
  config.access_token = "YOUR_BEARER_TOKEN"
end

opts = {
  channel_id: "550e8400-e29b-41d4-a716-446655440000",
  from: "2024-01-01T00:00:00Z",
  to: "2024-01-01T00:00:00Z",
  tag: "example"
}
Helo::Statistics.retrieve_totals(opts)
```


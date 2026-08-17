# frozen_string_literal: true

require "test_helper"

class StatisticsTest < Minitest::Test
  def test_retrieve_hourly
    request_data = {}

    stub_request(:get, "http://localhost:8002/statistics/hourly")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Statistics.retrieve_hourly(request_data)

    assert_instance_of Helo::StatisticsHourlyResponse, result
  end

  def test_retrieve_daily
    request_data = {}

    stub_request(:get, "http://localhost:8002/statistics/daily")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Statistics.retrieve_daily(request_data)

    assert_instance_of Helo::StatisticsDailyResponse, result
  end

  def test_retrieve_totals
    request_data = {}

    stub_request(:get, "http://localhost:8002/statistics/totals")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Statistics.retrieve_totals(request_data)

    assert_instance_of Helo::StatisticsTotalsResponse, result
  end
end

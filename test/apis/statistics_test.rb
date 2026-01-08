# frozen_string_literal: true

require "test_helper"

class StatisticsTest < Minitest::Test
  def test_retrieve_hourly
    request_data = {}

    stub_request(:get, "http://localhost:8002/activity/statistics/hourly")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Statistics.retrieve_hourly(request_data)

    assert_instance_of Helo::StatisticsResponse, result
  end

  def test_retrieve_daily
    request_data = {}

    stub_request(:get, "http://localhost:8002/activity/statistics/daily")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Statistics.retrieve_daily(request_data)

    assert_instance_of Helo::StatisticsResponse, result
  end

  def test_retrieve_totals
    request_data = {}

    stub_request(:get, "http://localhost:8002/activity/statistics/totals")
      .with(headers: { "Authorization" => "Bearer test-token-123" })
      .to_return(status: 200, body: {}.to_json, headers: { "Content-Type" => "application/json" })

    result = Helo::Statistics.retrieve_totals(request_data)

    assert_instance_of Helo::StatisticsTotalsResponse, result
  end
end

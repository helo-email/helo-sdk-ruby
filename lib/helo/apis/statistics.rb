# frozen_string_literal: true

module Helo
  class Statistics < API
    def retrieve_hourly(request_data = {})
      request = StatisticsRetrieveHourlyRequest.new(request_data)
      response = @client.request(:get, "/activity/statistics/hourly", params: request.to_params)
      StatisticsResponse.from_hash(response.body)
    end

    def retrieve_daily(request_data = {})
      request = StatisticsRetrieveDailyRequest.new(request_data)
      response = @client.request(:get, "/activity/statistics/daily", params: request.to_params)
      StatisticsResponse.from_hash(response.body)
    end

    def retrieve_totals(request_data = {})
      request = StatisticsRetrieveTotalsRequest.new(request_data)
      response = @client.request(:get, "/activity/statistics/totals", params: request.to_params)
      StatisticsTotalsResponse.from_hash(response.body)
    end

    class_methods :retrieve_hourly, :retrieve_daily, :retrieve_totals
  end
end

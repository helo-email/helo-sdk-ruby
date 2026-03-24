# frozen_string_literal: true

module Helo
  class Activity < API
    def list_events(request_data = {})
      request = ActivityListEventsRequest.new(request_data)
      response = @client.request(:get, "/activity/events", params: request.to_params)
      PaginatedEventsResponse.from_hash(response.body)
    end

    def list_messages(request_data = {})
      request = ActivityListMessagesRequest.new(request_data)
      response = @client.request(:get, "/activity/messages", params: request.to_params)
      PaginatedMessagesResponse.from_hash(response.body)
    end

    def retrieve_message(id)
      response = @client.request(:get, "/activity/messages/#{id}")
      MessageDetailsResponse.from_hash(response.body)
    end

    class_methods :list_events, :list_messages, :retrieve_message
  end
end

require 'rails_helper'

RSpec.describe 'get /api/v1/forecast', type: :request do
  let(:valid_headers) { Hash["Content-Type", "application/json", "Accept", "application/json"] }
  describe 'happy path' do
    it "returns a json forecast object when provided proper params and headers" do
      get '/api/v1/forecast?location=denver,co', headers: valid_headers, as: :json
      require "pry"; binding.pry
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data][:id]).to eq('null')
      expect(body[:data][:type]).to eq('forecast')
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes][:current_weather]).to be_a Hash
      expect(body[:data][:attributes][:current_weather][:datetime]).to be_a DateTime
      expect(body[:data][:attributes][:current_weather][:sunrise]).to be_a DateTime
      expect(body[:data][:attributes][:current_weather][:sunset]).to be_a DateTime
      expect(body[:data][:attributes][:current_weather][:temperature]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:feels_like]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:humidity]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:uvi]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:visibility]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:conditions]).to be_a String
      expect(body[:data][:attributes][:current_weather][:icon]).to be_a String
      expect(body[:data][:attributes][:daily_weather]).to be_a Hash
      expect(body[:data][:attributes][:daily_weather][:date]).to be_a Date
      expect(body[:data][:attributes][:daily_weather][:sunrise]).to be_a DateTime
      expect(body[:data][:attributes][:daily_weather][:sunset]).to be_a DateTime
      expect(body[:data][:attributes][:daily_weather][:max_temp]).to be_a Float
      expect(body[:data][:attributes][:daily_weather][:min_temp]).to be_a Float
      expect(body[:data][:attributes][:daily_weather][:conditions]).to be_a String
      expect(body[:data][:attributes][:daily_weather][:icon]).to be_a String
      expect(body[:data][:attributes][:hourly_weather]).to be_a Hash
      expect(body[:data][:attributes][:hourly_weather][:time]).to be_a Time
      expect(body[:data][:attributes][:hourly_weather][:temperature]).to be_a Float
      expect(body[:data][:attributes][:hourly_weather][:conditions]).to be_a String
      expect(body[:data][:attributes][:hourly_weather][:icon]).to be_a String
          # body = {
          #   "data": {
          #     "id": null,
          #     "type": "forecast",
          #     "attributes": {
          #       "current_weather": {
          #         "datetime": "2020-09-30 13:27:03 -0600",
          #         "temperature": 79.4,
          #         etc
          #       },
          #       "daily_weather": [
          #         {
          #           "date": "2020-10-01",
          #           "sunrise": "2020-10-01 06:10:43 -0600",
          #           etc
          #         },
          #         {...} etc
          #       ],
          #       "hourly_weather": [
          #         {
          #           "time": "14:00:00",
          #           "conditions": "cloudy with a chance of meatballs",
          #           etc
          #         },
          #         {...} etc
          #       ]
          #     }
          #   }
          # }
    end
  end
end

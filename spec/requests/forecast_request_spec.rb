require 'rails_helper'

RSpec.describe 'get /api/v1/forecast', type: :request do
  let(:valid_headers) { Hash["Content-Type", "application/json", "Accept", "application/json"] }

  describe 'happy path' do
    it "returns a json forecast object when provided proper params and headers", :vcr do
      get '/api/v1/forecast?location=denver,co', headers: valid_headers, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data].keys).to include(:id, :type, :attributes)
      expect(body[:data][:id]).to eq('null')
      expect(body[:data][:type]).to eq('forecast')
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes].keys).to include(
        :current_weather, :daily_weather, :hourly_weather
      )
      expect(body[:data][:attributes].keys).to_not include(
        :lat, :lon, :timezone, :timezone_offset, :minutely
      )
      expect(body[:data][:attributes][:current_weather]).to be_a Hash
      expect(body[:data][:attributes][:current_weather].keys).to include(
        :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi,
        :visibility, :conditions, :icon
      )
      expect(body[:data][:attributes][:current_weather].keys).to_not include(
        :dt, :temp, :pressure, :dew_point, :clouds, :wind_speed, :wind_deg, :wind_gust
      )
      expect(body[:data][:attributes][:current_weather][:datetime]).to be_a String
      expect(body[:data][:attributes][:current_weather][:sunrise]).to be_a String
      expect(body[:data][:attributes][:current_weather][:sunset]).to be_a String
      expect(body[:data][:attributes][:current_weather][:temperature]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:feels_like]).to be_a Float
      expect(body[:data][:attributes][:current_weather][:humidity]).to be_a Integer
      expect(body[:data][:attributes][:current_weather][:uvi]).to be_a_kind_of(Numeric)
      expect(body[:data][:attributes][:current_weather][:visibility]).to be_a Integer
      expect(body[:data][:attributes][:current_weather][:conditions]).to be_a String
      expect(body[:data][:attributes][:current_weather][:icon]).to be_a String
      expect(body[:data][:attributes][:daily_weather]).to be_a Array
      expect(body[:data][:attributes][:daily_weather].first.keys).to include(
        :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon
      )
      expect(body[:data][:attributes][:daily_weather].first.keys).to_not include(
        :moonrise, :moonset, :moon_phase, :pressure, :wind_gust, :wind_speed,
        :humidity, :dew_point, :wind_deg, :clouds, :pop, :uvi
      )
      expect(body[:data][:attributes][:daily_weather].first[:date]).to be_a String
      expect(body[:data][:attributes][:daily_weather].first[:sunrise]).to be_a String
      expect(body[:data][:attributes][:daily_weather].first[:sunset]).to be_a String
      expect(body[:data][:attributes][:daily_weather].first[:max_temp]).to be_a Float
      expect(body[:data][:attributes][:daily_weather].first[:min_temp]).to be_a Float
      expect(body[:data][:attributes][:daily_weather].first[:conditions]).to be_a String
      expect(body[:data][:attributes][:daily_weather].first[:icon]).to be_a String
      expect(body[:data][:attributes][:hourly_weather]).to be_a Array
      expect(body[:data][:attributes][:hourly_weather].first.keys).to include(
        :time, :temperature, :conditions, :icon
      )
      expect(body[:data][:attributes][:hourly_weather].first.keys).to_not include(
        :feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility,
        :wind_speed, :wind_deg, :wind_gust, :pop
      )
      expect(body[:data][:attributes][:hourly_weather].first[:time]).to be_a String
      expect(body[:data][:attributes][:hourly_weather].first[:temperature]).to be_a Float
      expect(body[:data][:attributes][:hourly_weather].first[:conditions]).to be_a String
      expect(body[:data][:attributes][:hourly_weather].first[:icon]).to be_a String
    end

    it "can accept a valid zip code", :vcr do
      get '/api/v1/forecast?location=12344'
      expect(response.status).to eq(200)
    end
  end

  describe 'sad path', :vcr do
    it "cannot return forecast without a location" do
      get '/api/v1/forecast'
      expect(response.status).to eq(400)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:errors]).to be_a Array
      expect(body[:errors].first).to eq("bad request")
    end

    it "does not return forecast with too many numbers in request" do
      # get '/api/v1/forecast?location=2484753284039023'
      # # expect(response.status).to eq(400)
      # body = JSON.parse(response.body, symbolize_names: true)
      # require "pry"; binding.pry
      # expect(body[:errors]).to be_a Array
      # expect(body[:errors].first).to eq("bad request")
    end
  end
end

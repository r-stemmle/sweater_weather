class Api::V1::ForecastsController < ApplicationController
  def show
    #dream driving ...
    conn = Faraday.new('http://www.mapquestapi.com')
    response = conn.get("/geocoding/v1/address?key=#{ENV['map_api_key']}&location=#{params[:location]}")
    lat_n_lng = JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first[:latLng]
    require "pry"; binding.pry
    conn = Faraday.new('https://weather')
    response = conn.get("/api/weather?loc=#{'latNlong'}")
    forecast_info = JSON.parse(response.body, symbolize_names: true)
    forecast = Forecast.new(forecast_info)
    render json: ForecastSerializer.new(forecast)
  end
end

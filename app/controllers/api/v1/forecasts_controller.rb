class Api::V1::ForecastsController < ApplicationController
  def show
    #dream driving ...
    conn = Faraday.new('https://mapquest')
    response = conn.get("/api/mapquest/loc=#{params[:location]}")
    lat_n_long = JSON.parse(response.body, symbolize_names: true)
    conn = Faraday.new('https://weather')
    response = conn.get("/api/weather?loc=#{'latNlong'}")
    forecast_info = JSON.parse(response.body, symbolize_names: true)
    forecast = Forecast.new(forecast_info)
    render json: ForecastSerializer.new(forecast)
  end
end

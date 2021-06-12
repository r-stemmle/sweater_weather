class Api::V1::ForecastsController < ApplicationController
  def show
    conn = Faraday.new('http://www.mapquestapi.com')
    response = conn.get("/geocoding/v1/address?key=#{ENV['map_api_key']}&location=#{params[:location]}")
    lat_n_lng = JSON.parse(response.body, symbolize_names: true)[:results].first[:locations].first[:latLng]
    conn = Faraday.new('https://api.openweathermap.org')
    response = conn.get('/data/2.5/onecall') do |req|
      req.params['lat'] = lat_n_lng[:lat]
      req.params['lon'] = lat_n_lng[:lng]
      req.params['appid'] = ENV['wx_api_key']
    end
    forecast_info = JSON.parse(response.body, symbolize_names: true)
    forecast = Forecast.new(forecast_info)
    render json: ForecastSerializer.new(forecast)
  end
end

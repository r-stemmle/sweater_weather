class ForecastFacade
  def self.get_forecast(location)
    #pass in locations from request and uri for OpenWeather API
    wx_service = WeatherService.new(location, '/data/2.5/onecall')
    Forecast.new(wx_service.get_forecast)
  end
end

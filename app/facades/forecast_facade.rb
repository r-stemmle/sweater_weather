class ForecastFacade
  def self.get_forecast(location)
    wx_service = WeatherService.new(location, '/data/2.5/onecall')
    Forecast.new(wx_service.get_forecast)
  end
end

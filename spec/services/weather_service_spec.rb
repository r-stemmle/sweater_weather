require 'rails_helper'

RSpec.describe WeatherService do
  describe "instance methods" do
    it "#get_forecast" do
      location = 'denver,co'
      endpoint = '/data/2.5/onecall'
      wx = WeatherService.new(location, endpoint)
      forecast = wx.get_forecast
      expect(forecast).to be_a Hash
      expect(forecast.keys).to eq(
        [:lat, :lon, :timezone, :timezone_offset, :current, :minutely, :hourly, :daily]
      )
    end
  end
end

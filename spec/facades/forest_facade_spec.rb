require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    it "returns a Forecast object", :vcr do
      location = 'denver,co'
      expect(ForecastFacade.get_forecast(location)).to be_an_instance_of Forecast
    end
  end
end

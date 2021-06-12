require 'rails_helper'

RSpec.describe Api::V1::ForecastsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/api/v1/forecast").to route_to("api/v1/forecasts#show")
    end
  end
end

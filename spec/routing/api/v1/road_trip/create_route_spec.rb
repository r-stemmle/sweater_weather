require 'rails_helper'

RSpec.describe Api::V1::RoadTripsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/v1/road_trip").to route_to("api/v1/road_trips#create")
    end
  end
end

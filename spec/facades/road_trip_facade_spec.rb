require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'class methods', :vcr do
    it "returns a road_trip object with proper origin and destination" do
      origin = "Denver,CO"
      destination = "Pueblo,CO"
      road_trip = RoadTripFacade.get_road_trip(origin, destination)
      expect(road_trip).to be_an_instance_of RoadTrip
    end
  end
end

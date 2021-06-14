require 'rails_helper'

RSpec.describe RoadTrip do
  describe 'it exists and has attributes' do
    it "new" do
      data = {
         :travel_time=>"01:44:22",
         :start_city=>"Denver,CO",
         :end_city=>"Pueblo,CO",
         :weather_at_eta=>
          {:dt=>1623682800,
           :temp=>295.23,
           :feels_like=>295.16,
           :pressure=>1021,
           :humidity=>64,
           :dew_point=>288.11,
           :uvi=>3.86,
           :clouds=>1,
           :visibility=>10000,
           :wind_speed=>1.65,
           :wind_deg=>352,
           :wind_gust=>2.44,
           :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
           :pop=>0}
         }
      road_trip = RoadTrip.new(data)
      expect(road_trip).to be_an_instance_of RoadTrip
      expect(road_trip.weather_at_eta).to be_a Hash  
    end
  end
end

require 'rails_helper'

RSpec.describe MapquestService do
  describe "instance methods" do
    it "#get_lat_lng" do
      endpoint = '/geocoding/v1/address'
      mapquest = MapquestService.new(endpoint)
      lat_n_lng = mapquest.get_lat_lng('denver,co')
      expect(lat_n_lng).to be_a Hash
      expect(lat_n_lng[:lat]).to be_a Float
      expect(lat_n_lng[:lng]).to be_a Float
    end
  end
end

require 'rails_helper'

RSpec.describe PexelService do
  describe "instance methods" do
    it "exists and has attributes" do
      endpoint = '/v1/search'
      location = 'denver,co'
      pexel = PexelService.new(location, endpoint)
      expect(pexel).to be_an_instance_of PexelService
      expect(pexel.location).to eq(location)
      expect(pexel.endpoint).to eq(endpoint)
    end

    it "#get_image" do
      endpoint = '/v1/search'
      location = 'denver,co'
      pexel = PexelService.new(location, endpoint)
      pexel_image = pexel.get_image
      expect(pexel_image).to be_a_kind_of(Hash)
      expect(pexel_image.keys).to include(
        :id, :width, :height, :url, :photographer, :photographer_url, :avg_color, :src
      )
      expect(pexel_image[:url]).to be_a String
      expect(pexel_image[:photographer]).to be_a String
      expect(pexel_image[:photographer_url]).to be_a String
      expect(pexel_image[:src][:original]).to be_a String
    end
  end
end

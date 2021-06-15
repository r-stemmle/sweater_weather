require 'rails_helper'

RSpec.describe ImageFacade do
  describe 'class methods' do
    it "returns a Image object", :vcr do
      location = 'denver,co'
      expect(ImageFacade.get_image(location)).to be_an_instance_of Image
    end
  end
end

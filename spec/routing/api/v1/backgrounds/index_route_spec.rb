require 'rails_helper'

RSpec.describe Api::V1::BackgroundsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/backgrounds").to route_to("api/v1/backgrounds#index")
    end
  end
end

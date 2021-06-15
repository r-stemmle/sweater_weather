require 'rails_helper'

RSpec.describe 'post /api/v1/road_trip', type: :request do
  let(:valid_headers) {
    Hash["Content-Type", "application/json", "Accept", "application/json"]
  }
  let(:valid_body) {
    { road_trip:
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "p+K71asjfKVCw15UuzaKNpx2E80++Z4H"
      }
    }
  }

  describe 'happy path' do
    it "creates a user session and returns their api key" do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/road_trip', headers: valid_headers, params: valid_body, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes][:weather_at_eta]).to be_a Hash
      # require "pry"; binding.pry
    end
  end
end

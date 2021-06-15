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
  let(:missing_origin) {
    { road_trip:
      {
        destination: "Pueblo,CO",
        api_key: "p+K71asjfKVCw15UuzaKNpx2E80++Z4H"
      }
    }
  }
  let(:incorrect_key) {
    { road_trip:
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "p+K71asjfKVCw15UuzaKNpx2E80++Z465"
      }
    }
  }
  let(:missing_key) {
    { road_trip:
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO"
      }
    }
  }
  let(:crazy_directions) {
    { road_trip:
      {
        origin: "Denver,CO",
        destination: "London,UK",
        api_key: "p+K71asjfKVCw15UuzaKNpx2E80++Z4H"
      }
    }
  }

  describe 'happy path' do
    it "creates a user session and returns their api key", :vcr do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/road_trip', headers: valid_headers, params: valid_body, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data][:id]).to eq("null")
      expect(body[:data][:type]).to eq("road_trip")
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes].keys).to include(
        :start_city, :end_city, :travel_time, :weather_at_eta
      )
      expect(body[:data][:attributes][:start_city]).to be_a String
      expect(body[:data][:attributes][:end_city]).to be_a String
      expect(body[:data][:attributes][:travel_time]).to be_a String
      expect(body[:data][:attributes][:weather_at_eta]).to be_a Hash
      expect(body[:data][:attributes][:weather_at_eta].keys).to include(
        :temperature, :conditions
      )
      expect(body[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
      expect(body[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
    end
  end

  describe 'sad path' do
    it "returns 401 with INCORRECT api key", :vcr do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/road_trip', headers: valid_headers, params: incorrect_key, as: :json
      expect(response.status).to eq(401)
    end
    it "returns 401 with NO api key", :vcr do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/road_trip', headers: valid_headers, params: missing_key, as: :json
      expect(response.status).to eq(401)
    end
    it "returns 400 with NO origin", :vcr do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/road_trip', headers: valid_headers, params: missing_origin, as: :json
      expect(response.status).to eq(400)
    end
    it "returns impossible route with land masses not connected", :vcr do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/road_trip', headers: valid_headers, params: crazy_directions, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data][:attributes][:travel_time]).to eq("impossible")
      expect(body[:data][:attributes][:weather_at_eta]).to be_nil
    end
  end
end

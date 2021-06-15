require 'rails_helper'

RSpec.describe 'post /api/v1/sessions', type: :request do
  let(:valid_headers) {
    Hash["Content-Type", "application/json", "Accept", "application/json"]
  }
  let(:valid_body) {
    { user:
      {
        email: "testman@themail.com",
        password: 'runner1234',
      }
    }
  }
  let(:bad_password) {
    { user:
      {
        email: "testman@themail.com",
        password: 'rrunner1234',
      }
    }
  }
  let(:bad_email) {
    { user:
      {
        email: "stdtestman@themail.com",
        password: 'runner1234',
      }
    }
  }

  describe 'happy path' do
    it "creates a user session and returns their api key", :vcr do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/sessions', headers: valid_headers, params: valid_body, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data].keys).to include(:type, :id, :attributes)
      expect(body[:data][:type]).to be_a String
      expect(body[:data][:id]).to be_a String
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes].keys).to include(:email, :api_key)
      expect(body[:data][:attributes][:email]).to be_a String
      expect(body[:data][:attributes][:api_key]).to be_a String
    end
  end

  describe 'sad path' do
    it "passes 404 'incorrect username or password' when wrong password entered" do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/sessions', headers: valid_headers, params: bad_password, as: :json
      expect(response.status).to eq(404)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:errors].first).to eq("incorrect username or password")
    end
    
    it "passes 404 'incorrect username or password' when wrong email entered" do
      user = User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/sessions', headers: valid_headers, params: bad_email, as: :json
      expect(response.status).to eq(404)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:errors].first).to eq("incorrect username or password")
    end
  end
end

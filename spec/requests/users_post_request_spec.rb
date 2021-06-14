require 'rails_helper'

RSpec.describe 'post /api/v1/users', type: :request do
  let(:valid_headers) {
    Hash["Content-Type", "application/json", "Accept", "application/json"]
  }
  let(:valid_body) {
    { user:
      {
        email: "testman@themail.com",
        password: 'runner1234',
        password_confirmation: 'runner1234'
      }
    }
  }

  describe 'happy path' do
    it "creates a user and returns an api key" do
      post '/api/v1/users', headers: valid_headers, params: valid_body, as: :json
      expect(response.status).to eq(201)
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
end

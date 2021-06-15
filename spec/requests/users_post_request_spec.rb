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
  let(:missing_email) {
    { user:
      {
        email: "",
        password: 'runner1234',
        password_confirmation: 'runner1234'
      }
    }
  }
  let(:not_matching) {
    { user:
      {
        email: "",
        password: 'runner2134',
        password_confirmation: 'runner1234'
      }
    }
  }
  let(:missing_field) {
    { user:
      {
        email: "",
        password: 'runner2134'
      }
    }
  }

  describe 'happy path' do
    it "creates a user and returns an api key", :vcr do
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

  describe 'sad path' do
    it "returns proper error with bad body request" do
      post '/api/v1/users', headers: valid_headers, params: missing_email, as: :json
      expect(response.status).to eq(400)
    end
    it "returns proper error with bad body request" do
      post '/api/v1/users', headers: valid_headers, params: not_matching, as: :json
      expect(response.status).to eq(400)
    end
    it "returns proper error with bad body request" do
      post '/api/v1/users', headers: valid_headers, params: missing_field, as: :json
      expect(response.status).to eq(400)
    end
    it "returns proper error with matching emails" do
      User.create!(email: "testman@themail.com", password: 'runner1234', api_key: 'p+K71asjfKVCw15UuzaKNpx2E80++Z4H')
      post '/api/v1/users', headers: valid_headers, params: valid_body, as: :json
      expect(response.status).to eq(400)
    end
  end
end

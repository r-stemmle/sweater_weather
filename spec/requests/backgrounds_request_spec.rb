require 'rails_helper'

RSpec.describe 'get /api/v1/backgrounds', type: :request do
  let(:valid_headers) { Hash["Content-Type", "application/json", "Accept", "application/json"] }

  describe 'happy path' do
    it "can fetch a background image for the city requested", :vcr do
      get '/api/v1/backgrounds?location=denver', headers: valid_headers, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data].keys).to include(:type, :id, :attributes)
      expect(body[:data][:id]).to eq('null')
      expect(body[:data][:type]).to eq('image')
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes].keys).to include(:image)
      expect(body[:data][:attributes][:image]).to be_a Hash
      expect(body[:data][:attributes][:image].keys).to include(
        :url, :credit, :source, :link
      )
      expect(body[:data][:attributes][:image][:url]).to be_a String
      expect(body[:data][:attributes][:image][:source]).to be_a String
      expect(body[:data][:attributes][:image][:link]).to be_a String
      expect(body[:data][:attributes][:image][:credit]).to be_a Hash
      expect(body[:data][:attributes][:image][:credit].keys).to include(
        :photographer, :photographer_url
      )
      expect(body[:data][:attributes][:image][:credit][:photographer]).to be_a String
      expect(body[:data][:attributes][:image][:credit][:photographer_url]).to be_a String
    end
  end

  describe 'sad path' do
    it "cannot return background image without location param", :vcr do
      get '/api/v1/backgrounds'
      expect(response.status).to eq(400)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:errors]).to be_a Array
      expect(body[:errors].first).to eq("bad request")
    end
  end
end

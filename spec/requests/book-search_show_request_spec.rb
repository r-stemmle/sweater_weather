require 'rails_helper'

RSpec.describe 'get /api/v1/book-search', type: :request do
  let(:valid_headers) {
    Hash["Content-Type", "application/json", "Accept", "application/json"]
  }

  describe 'happy path' do
    it "returns dest city, forecast, total books #, books" do
      get '/api/v1/book-search?location=denver,co&quantity=5', headers: valid_headers, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a Hash
      expect(body[:data][:id]).to eq("null")
      expect(body[:data][:type]).to eq("books")
      expect(body[:data][:attributes].keys).to include(
        :destination, :forecast, :total_books_found, :books
      )
      expect(body[:data][:attributes][:destination]).to eq('denver')
      expect(body[:data][:attributes][:forecast].keys).to include(:summary, :temperature)
      expect(body[:data][:attributes][:forecast][:summary]).to be_a String
      expect(body[:data][:attributes][:forecast][:temperature]).to be_a String
      expect(body[:data][:attributes][:total_books_found]).to be_a Integer
      expect(body[:data][:attributes][:books]).to be_a Array
      expect(body[:data][:attributes][:books].size).to eq(5)
      expect(body[:data][:attributes][:books].first.keys).to include(
        :title, :authors
      )
      expect(body[:data][:attributes][:books].first[:title]).to be_a String
      expect(body[:data][:attributes][:books].first[:authors]).to be_a Array
      expect(body[:data][:attributes][:books].first[:authors].first).to be_a Hash
      expect(body[:data][:attributes][:books].first[:authors].first.keys).to eq([:key, :name])
      expect(body[:data][:attributes][:books].first[:authors].first[:key]).to be_a String
      expect(body[:data][:attributes][:books].first[:authors].first[:name]).to be_a String
    end

    it "still works if no quantity is included" do
      get '/api/v1/book-search?location=denver,co', headers: valid_headers, as: :json
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data][:attributes][:books].size).to be_a Integer
    end
  end

  describe 'sad path' do
    it "returns 404 with no params" do
      get '/api/v1/book-search', headers: valid_headers, as: :json
      expect(response.status).to eq(404)
    end
  end


end

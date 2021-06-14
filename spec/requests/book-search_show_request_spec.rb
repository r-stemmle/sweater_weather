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
      require "pry"; binding.pry
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::BookSearchesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/api/v1/book-search").to route_to("api/v1/book_searches#show")
    end
  end
end

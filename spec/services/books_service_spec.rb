require 'rails_helper'

RSpec.describe BooksService do
  describe "instance methods" do
    it "exists and has attributes" do
      location = 'denver,co'
      quantity = 5
      books_service = BooksService.new(location, quantity)
      expect(books_service).to be_an_instance_of BooksService
    end
  end
end

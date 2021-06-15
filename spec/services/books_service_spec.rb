require 'rails_helper'

RSpec.describe BooksService do
  describe "instance methods" do
    it "exists and has attributes" do
      location = 'denver,co'
      quantity = 5
      books_service = BooksService.new(location, quantity)
      expect(books_service).to be_an_instance_of BooksService
      expect(books_service.subject).to eq('denver')
      expect(books_service.quantity).to eq(quantity)
      expect(books_service.endpoint).to eq("/subjects/denver.json?limit=5")
      expect(books_service.get_books).to be_a Hash
      expect(books_service.get_books.keys).to include(:key, :name, :subject_type, :work_count, :works)
    end
  end
end

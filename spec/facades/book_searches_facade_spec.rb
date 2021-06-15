require 'rails_helper'

RSpec.describe BookSearchesFacade do
  describe 'class methods' do
    it "returns books object" do
      location = 'denver,co'
      quantity = 5
      expect(BookSearchesFacade.get_books(location, quantity)).to be_an_instance_of Books
    end
  end
end

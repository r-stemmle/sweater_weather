class Api::V1::BookSearchesController < ApplicationController

  def show
    books = BookSearchesFacade.get_books(location, quantity)
    render json: BooksSerializer.new(books)
  end
end

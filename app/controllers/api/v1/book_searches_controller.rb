class Api::V1::BookSearchesController < ApplicationController

  def show
    unless params[:location].nil?
      books = BookSearchesFacade.get_books(params[:location], params[:quantity])
      render json: BooksSerializer.new(books)
    else
      render json: {errors: ['incorrect query']}, status: 404
    end
  end
end

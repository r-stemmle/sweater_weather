class BookSearchesFacade
  def self.get_books(location, quantity)
    books_service = BooksService.new(location, quantity)
    wx_service = WeatherService.new(location, '/data/2.5/onecall')
    Books.new(books_service.get_books, wx_service.get_forecast)
  end
end

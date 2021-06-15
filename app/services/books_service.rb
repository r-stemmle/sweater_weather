class BooksService
  include Json

  attr_reader :connection, :endpoint, :quantity, :subject

  def initialize(location, quantity, conn= Faraday.new('https://openlibrary.org'))
    @subject = location[/^([^,])+/]
    @quantity = quantity
    @endpoint = "/subjects/#{subject}.json?limit=#{quantity}"
    @connection = conn
  end

  def get_books
    response = connection.get(endpoint)
    parse(response.body)
  end
end

class BooksService
  include Json

  attr_reader :connection, :endpoint, :quantity, :location

  def initialize(location, quantity, conn= Faraday.new('https://openlibrary.org'))
    @location = location
    @quantity = quantity
    @endpoint = endpoint
    @connection = conn
  end

  def get_books
    response = connection.get(endpoint) do |req|
      req.params['lat'] = lat_n_lng[:lat]
      req.params['lon'] = lat_n_lng[:lng]
      req.params['appid'] = ENV['wx_api_key']
    end
    x = parse(response.body)
    require "pry"; binding.pry
  end
end

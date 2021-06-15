class Books
  include Kelvin

  attr_reader :id

  def initialize(books, forecast)
    @id = 'null'
    @data = books
    @weather = forecast
  end

  def books
    @data[:works].map do |work|
      {
        title: work[:title],
        authors: work[:authors]
      }
    end
  end

  def total_books_found
    @data[:work_count]
  end

  def destination
    @data[:name]
  end

  def forecast
    {
      summary: @weather[:current][:weather].first[:description],
      temperature: "#{kelvin_to_fh(@weather[:current][:temp])} F"
    }
  end
end

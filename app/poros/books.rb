class Books
  def initialize(books, forecast)
    @data = books
    @weather = forecast
  end

  def books
    @data[:works].map do |work|
      [
        {
          title: work[:title],
          authors: work[:authors]
        }
      ]
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
      temperature: kelvin_to_fh(@weather[:current][:temp])
    }
  end

  def kelvin_to_fh(kelvin)
    f = (kelvin - 273.15) * (9/5) + 32
    f.round(2)
  end
end

class RoadTrip
  include Kelvin

  attr_reader :start_city, :end_city, :id

  def initialize(data)
    @data = data
    @id = "null"
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = data[:travel_time]
    @weather_at_eta = data[:weather_at_eta]
  end

  def weather_at_eta
    if @data[:travel_time].nil?
      return nil
    else
      {
        temperature: kelvin_to_fh(@weather_at_eta[:temp]),
        conditions: @weather_at_eta[:weather].first[:description]
      }
    end
  end

  def travel_time
    if @data[:travel_time].nil?
      "impossible"
    else
      @data[:travel_time]
    end
  end
end

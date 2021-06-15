class RoadTrip
  include Kelvin

  attr_reader :start_city, :end_city, :travel_time, :id

  def initialize(data)
    @id = "null"
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = data[:travel_time]
    @weather_at_eta = data[:weather_at_eta]
  end

  def weather_at_eta
    {
      temperature: kelvin_to_fh(@weather_at_eta[:temp]),
      conditions: @weather_at_eta[:weather].first[:description]
    }
  end
end

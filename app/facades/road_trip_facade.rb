class RoadTripFacade
  def self.get_road_trip(from, to)
    map_service = MapquestService.new('/directions/v2/route')
    wx_service = WeatherService.new(to, '/data/2.5/onecall')
    data = map_service.get_route(from , to)
    data[:weather_at_eta] = wx_service.get_forecast[:hourly][data[:travel_time].to_i + 1]
    RoadTrip.new(data)
  end
end

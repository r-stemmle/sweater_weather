class MapquestService
  include Json

  attr_reader :connection, :endpoint

  def initialize(endpoint, url= 'http://www.mapquestapi.com')
    @connection = Faraday.new(url)
    @endpoint = endpoint
  end

  def get_route(from, to)
    route_overview = {}
    response = connection.get(endpoint) do |req|
      req.params['key'] = ENV['map_api_key']
      req.params['from'] = from
      req.params['to'] = to
    end
    info = parse(response.body)
    route_overview[:travel_time] = info[:route][:formattedTime]
    route_overview[:start_city] = from
    route_overview[:end_city] = to
    route_overview
  end

  def get_lat_lng(address)
    response = connection.get(endpoint) do |req|
      req.params['key'] = ENV['map_api_key']
      req.params['location'] = address
    end
    info = parse(response.body)
    info[:results].first[:locations].first[:latLng]
  end
end

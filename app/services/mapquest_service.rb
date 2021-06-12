class MapquestService
  attr_reader :connection, :endpoint

  def initialize(endpoint, url= 'http://www.mapquestapi.com')
    @connection = Faraday.new(url)
    @endpoint = endpoint
  end

  def get_lat_lng(address)
    response = connection.get(endpoint) do |req|
      req.params['key'] = ENV['map_api_key']
      req.params['location'] = address
    end
    info = parse(response.body)
    info[:results].first[:locations].first[:latLng]
  end

  def parse(data)
    JSON.parse(data, symbolize_names: true)
  end
end

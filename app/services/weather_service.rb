class WeatherService
  attr_reader :connection, :endpoint, :lat_n_lng

  def initialize(location, endpoint, url= 'https://api.openweathermap.org')
    @lat_n_lng = MapquestService.new('/geocoding/v1/address').get_lat_lng(location)
    @connection = Faraday.new(url)
    @endpoint = endpoint
  end

  def get_forecast
    response = connection.get(endpoint) do |req|
      req.params['lat'] = lat_n_lng[:lat]
      req.params['lon'] = lat_n_lng[:lng]
      req.params['appid'] = ENV['wx_api_key']
    end
    parse(response.body)
  end

  def parse(data)
    JSON.parse(data, symbolize_names: true)
  end
end

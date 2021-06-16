class PexelService
  include Json

  attr_reader :location, :endpoint, :connection, :key

  def initialize(location, endpoint, conn= Faraday.new('https://api.pexels.com'))
    @location = location
    @endpoint = endpoint
    @connection = conn
    @key = ENV['pix_api_key']
  end

  def get_image
    set_api_key
    resp = connection.get(endpoint) do |req|
      req.params['query'] = location
      req.params['per_page'] = 3
    end
    one_of_three = parse(resp.body)[:photos].sample
  end

  def set_api_key
    connection.headers[:Authorization] = key
  end
end

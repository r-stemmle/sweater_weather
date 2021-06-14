class ImageFacade
  def self.get_image(location)
    #pass in locations from request and uri for pexel API
    pexel_service = PexelService.new(location, '/v1/search')
    Image.new(pexel_service.get_image)
  end
end

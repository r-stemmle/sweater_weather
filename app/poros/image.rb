class Image
  attr_reader :id
  
  def initialize(data)
    @id = 'null'
    @image = data
  end

  def image
    {
      url: @image[:url],
      source: @image[:src][:original],
      link: 'https://help.pexels.com/hc/en-us',
      credit: {
        photographer: @image[:photographer],
        photographer_url: @image[:photographer_url]
      }
    }
  end
end

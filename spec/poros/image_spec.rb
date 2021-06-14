require 'rails_helper'

RSpec.describe Image do
  it "exists and has attributes" do
    data = {
      :id=>325185,
      :width=>5472,
      :height=>3648,
      :url=>"https://www.pexels.com/photo/view-of-cityscape-325185/",
      :photographer=>"Aleksandar Pasaric",
      :photographer_url=>"https://www.pexels.com/@apasaric",
      :photographer_id=>105079,
      :avg_color=>"#CBD0D6",
      :src=>
       {
         :original=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg",
          :large2x=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          :large=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          :medium=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&h=350",
          :small=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&h=130",
          :portrait=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          :landscape=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          :tiny=>"https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
        },
       :liked=>false
    }
    image = Image.new(data)
    expect(image).to be_an_instance_of Image
    expect(image.id).to eq('null')
    expect(image.image).to be_a Hash
  end
end

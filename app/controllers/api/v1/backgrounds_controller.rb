class Api::V1::BackgroundsController < ApplicationController
  def index
    background = ImageFacade.get_image(params[:location])
    render json: BackgroundSerializer.new(background)
  end
end

class Api::V1::BackgroundsController < ApplicationController

  def index
    unless params[:location].nil?
      background = ImageFacade.get_image(params[:location])
      render json: BackgroundSerializer.new(background)
    else
      no_location
    end
  end

  private

  def no_location
    render json: {errors: ["bad request"]}, status: 400
  end
end

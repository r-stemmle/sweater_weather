class Api::V1::BackgroundsController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :no_location

  def index
    background = ImageFacade.get_image(params[:location])
    render json: BackgroundSerializer.new(background)
  end

  private

  def location
    params.require(:location)
  end

  def no_location
    render json: {errors: ["bad request"]}, status: 400
  end
end

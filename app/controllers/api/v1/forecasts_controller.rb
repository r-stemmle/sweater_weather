class Api::V1::ForecastsController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :no_location

  def show
    forecast = ForecastFacade.get_forecast(location)
    render json: ForecastSerializer.new(forecast)
  end

  private

  def location
    params.require(:location)
  end

  def no_location
    render json: {errors: ["bad request"]}, status: 400
  end
end

class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = ForecastFacade.get_forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end

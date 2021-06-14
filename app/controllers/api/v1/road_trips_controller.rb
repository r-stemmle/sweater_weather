class Api::V1::RoadTripsController < ApplicationController
  def create
    if User.exists?(api_key: road_trip_params[:api_key])
      road_trip = RoadTripFacade.get_road_trip(road_trip_params[:origin], road_trip_params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: {errors: ["unauthorized"]}, status: 401
    end
  end

  private

  def road_trip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end
end

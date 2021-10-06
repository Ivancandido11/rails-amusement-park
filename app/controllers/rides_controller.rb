class RidesController < ApplicationController
  def create
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:ride][:attraction_id])
    @ride.take_ride
    redirect_to user_path(session[:user_id], ride_id: @ride.id)
  end
end

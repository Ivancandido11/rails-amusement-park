class AttractionsController < ApplicationController
  before_action :find_attraction, only: :show

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

private

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end
end

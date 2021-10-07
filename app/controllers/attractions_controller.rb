class AttractionsController < ApplicationController
  before_action :find_attraction, only: %i[show edit update]
  before_action :only_allow_admin
  skip_before_action :only_allow_admin, only: %i[index show]

  helper_method :admin?

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  def show
    @ride = Ride.new
  end

  def edit; end

  def update
    @attraction.update(attraction_params)

    if @attraction.valid?
      redirect_to @attraction
    else
      render :edit
    end
  end

private

  def admin?
    return unless session[:user_id]

    @user = User.find(session[:user_id])
    @user.admin
  end

  def only_allow_admin
    user = User.find(session[:user_id])
    redirect_to "/attractions" unless user.admin == true
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end

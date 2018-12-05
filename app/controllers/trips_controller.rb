class TripsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, except: :new
  before_action :set_trip, only: [:edit, :destroy, :update, :show]

  def index
    @trips = current_user.trips
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save

    coord = @trip.get_coord
    redirect_to trip_venues_path(@trip)
  end

  def show

  end

  def edit
  end

  def update
    @trip.update(trip_params)
  end

  def destroy
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:start_day, :end_day, :city)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end

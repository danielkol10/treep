class VenuesController < ApplicationController
  include ApplicationHelper

  def new
    @venue = Venue.new
    @section = params["section"]
    @trip = Trip.find(params[:trip_id])
    @location = @trip.city
    @price = 2

    if !params["search"].nil? && params["search"]["food_type"]
      @food_type = params["search"]["food_type"]
      @venues = foursquare_api(@food_type, 2, @section, @location)
    end
  end

  def create
<<<<<<< HEAD
  end
=======
    @venue = Venue.new(venue_params)
    @venue.save
    redirect_to new_trip_venue_path
  end

  def venue_params
    params.require(:venue).permit(:name, :location, :trip_id)
  end
>>>>>>> e5d65a10db3a6287434287d1b4f6e475de5b5174
end

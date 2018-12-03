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

    # foursquare_api(query, 2, "food", Trip.last.city)
    # results = foursquare_api("query", 2, section, "london")
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    redirect_to new_trip_venue_path
  end

  def venue_params
    params.require(:venue).permit(:name, :location, :trip_id)
  end
end

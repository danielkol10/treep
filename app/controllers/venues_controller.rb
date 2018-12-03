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
  end
end

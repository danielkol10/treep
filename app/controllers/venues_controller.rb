class VenuesController < ApplicationController
  include ApplicationHelper

  def index
   @trip = Trip.find(params[:trip_id])
   @foursquare_sub_categories = FoursquareCategory.all
   @foursquare_main_categories = ["Food","Nightlife","culture","outdoors"]
  end

  def new
    # @venue = Venue.new
    # @section = params["section"]
    # @trip = Trip.find(params[:trip_id])
    # @location = @trip.city
    # @price = 2

    # if !params["search"].nil? && params["search"]["food_type"]
    #   @food_type = params["search"]["food_type"]
    #   @venues = foursquare_api(@food_type, 2, @section, @location)
    # end

    # foursquare_api(query, 2, "food", Trip.last.city)
    # results = foursquare_api("query", 2, section, "london")
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @location = @trip.city
    @price = 2

    if !params["sub_category"]["choices"].drop(1).nil?
      @chosen_categories = params["sub_category"]["choices"].drop(1)
      @chosen_categories.each do |category|
        @result = foursquare_api(FoursquareCategory.find(category).category_id, @location)
        if !@result.nil?
          @result.first(2).each do |venue|
            @venue = Venue.new(name: venue[:name], location: venue[:address])
            raise
            @venue.save
          end
        end
      end
    end

    redirect_to trip_venues_path
  end

  def venue_params
    params.require(:venue).permit(:name, :location, :trip_id)
  end
end

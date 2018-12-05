class VenuesController < ApplicationController
  include ApplicationHelper
  def index
    @trip = Trip.find(params[:trip_id])
    @foursquare_sub_categories = FoursquareCategory.all
    @foursquare_main_categories = ["Food", "Nightlife", "culture", "outdoors"]
  end

  def new
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
            details = venue_details_api(venue[:venue_id])
            @venue = Venue.new(name: venue[:name], location: venue[:address], trip_id: @trip.id, img_url: Venue::FOURSQUARE_CATEGORY_IMAGES[venue[:category_id]], description: details[:description], facebook: details[:facebook], phone: details[:phone], instagram: details[:instagram], category_tag: details[:category_tag], price_tier: details[:price_tier], likes: details[:likes], rating: details[:rating])
            @venue.img_url = Venue::GENERIC_VENUE_IMAGE if @venue.img_url.nil?
            @venue.save
          end
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to trip_venues_path }
      format.js
    end
  end
end

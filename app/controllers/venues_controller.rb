class VenuesController < ApplicationController
  def new
    @venue = Venue.new
    query = params["search"]["food_type"]
    # foursquare_api(query, 2, "food", Trip.last.city)
    results = foursquare_api(query, 2, "food", "london")
  end

  def create

  end

end

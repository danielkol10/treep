class TripsController < ApplicationController
  before_action :authenticate_user!, except: :new

  before_action :set_trip, only: [:edit, :destroy, :update, :show]

  def index
    # should be empty
    # or just use it as Dashboard, for "My Trips"
  end

  def new
    # this should be the first page after Home page
    # where the user chooses the tags/preferences
    # then he clicks "Create/Generate Trip"
    @trip = Trip.new
    @start_day = params["search"]["starts_at"]
    @end_day = params["search"]["ends_at"]
    @city = params["search"]["city_query"]
    @number_of_people = params["search"]["people_query"]
  end

  def create

    # POST request must work with the API..
    # ALL THE IMPORTANT WORK
    # how to translate users answers on preferences to API tags...

    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save
    @trip_categories = params["trip"]["category_ids"]
    @trip_categories.pop
    @trip_categories = @trip_categories.drop(1)

    @trip_categories.each do |cat|
      TripCategory.create(trip_id: @trip.id, category_id: cat)
    end

    coord = @trip.get_coord
    # @venue = Venue.new # (API CALL)
    # @event = Event.new # (API CALL)
    # coord_query = params[:city]
    @results = api_call(coord)

    redirect_to trip_path(@trip)
   end

  def show
    # we can use it when you click on one of the trips in "My trips" list
    # to see the past/current trips details
    # which is the same as the edit page but without option to edit
    # connected to Index / Dashboard / "My trips"

    @chosen_categories = @trip.chosen_categories
    @venues_serials = []
    @chosen_categories.each do |category|
      category.serials.each do |serial|
        @venues_serials << serial
      end
    end
    # @venues_serials.join(',')

    @trips = Trip.where.not(latitude: nil, longitude: nil) #This will later be events and venues
    @markers = @trips.map do |trip|
      {
        lng: trip.longitude,
        lat: trip.latitude
      }
    end
  end


  def edit
    # Baraa - I think this should be the page where the user can
    # choose and change between difference venues/events to finalize
    # the trip
    # Also to give access to this page again from "My Trips" - edit?
    # here the user is actually updating/deleting venues or events.
  end

  def update
    # POST request - finalize the trip and save the changes
    # Also to give access to this page again from "My Trips" - edit?
    @trip.update(trip_params)
  end

  def destroy
    # we can add this button in the "My trips" Dashboard.
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:start_day, :end_day, :number_of_people, :city, :budget)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def api_call(coord_query)
    @foursquare = Foursquare2::Client.new(
      client_id: ENV['FOURSQUARE_ID'],
      client_secret: ENV['FOURSQUARE_SECRET']
    )
   @results = @foursquare.search_venues(ll: coord_query, v: '20180323')
  end
end

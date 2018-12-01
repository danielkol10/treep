class TripsController < ApplicationController
  include ApplicationHelper
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
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save

    key = ENV['EVENTBRITE']
    base_url = "https://www.eventbriteapi.com/v3/events/"
    latitude = @trip.latitude
    longitude = @trip.longitude

    eventbrite_response = Faraday.new(url: base_url) do |f|
      f.adapter :net_http
      f.response :json
    end

    response = eventbrite_response.get("search/?", token: key, "location.latitude": latitude, "location.longitude": longitude, categories: "103")
    raise
    events_trip = []
    parsed_response.each do |event|
    end

    redirect_to trip_path(@trip)
    #eventbrite_url = "https://www.eventbriteapi.com/v3/events/search/?token=#{key}&location.latitude=#{latitude}&location.longitude=#{longitude}&location.within=2mi"
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

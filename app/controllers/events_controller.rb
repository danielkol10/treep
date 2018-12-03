class EventsController < ApplicationController
  include ApplicationHelper
  def index
    @trip = Trip.find(params[:trip_id])
    @eventbrite_categories = EventbriteCategory.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @event = Event.new
    @slug = params["categories"]
    @latitude = @trip.latitude
    @longitude = @trip.longitude
    @start_day = @trip.start_day
    # @s = @start_day.iso8601 need to convert to format yyyy-MM-ddTHH:mm:ssZ and it will work
    @end_day = @trip.end_day
    # @e = DateTime.strptime(@end_day, "%Y-%m-%dT%l:%M:%S%z")
    @events = eventbrite_api(@latitude, @longitude, @start_day, @end_day, @slug)
    raise
  end
end

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
    @formatted_start = @start_day.strftime('%Y-%m-%dT%H:%M:%S')
    @end_day = @trip.end_day
    @formatted_end = @end_day.strftime('%Y-%m-%dT%H:%M:%S')
    @events = eventbrite_api(@latitude, @longitude, @formatted_start, @formatted_end, @slug)
  end
end

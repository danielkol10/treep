class EventsController < ApplicationController
  include ApplicationHelper
  def index
    @trip = Trip.find(params[:trip_id])
    @eventbrite_main_categories = ["Music", "Business", "Film & Media", "Science & Tech"]
    @eventbrite_sub_categories = eventbrite_sub_categories
  end

  def create
    @eventbrite_sub_categories = eventbrite_sub_categories
    @trip = Trip.find(params[:trip_id])
    @latitude = @trip.latitude
    @longitude = @trip.longitude

    @start_day = @trip.start_day
    @formatted_start = @start_day.strftime('%Y-%m-%dT%H:%M:%S')
    @end_day = @trip.end_day
    @formatted_end = @end_day.strftime('%Y-%m-%dT%H:%M:%S')

    if !params["sub_category"]["choices"].drop(1).nil?
      @chosen_categories = params["sub_category"]["choices"].drop(1)
      @chosen_categories.each do |category, values|
        @result = eventbrite_api(@latitude, @longitude, @formatted_start, @formatted_end, @eventbrite_sub_categories[category][0], @eventbrite_sub_categories[category][1])

        if !@result.nil?
          @result.first(2).each do |event|
            @event = Event.new(name: event[:name], latitude: event[:latitude], longitude: event[:longitude], event_start: event[:event_start], event_end: event[:event_end], trip_id: @trip.id, img_url: Event::EVENTBRITE_SUB_CATEGORY_IMAGES[event[:sub_category]])
            @event.save
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

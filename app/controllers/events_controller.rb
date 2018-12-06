class EventsController < ApplicationController
  include ApplicationHelper
  def index
    @trip = Trip.find(params[:trip_id])
    @eventbrite_categories = {
      "subcategories" => {
        "Music" => {
          "Jazz & Blues" => ["103", "3002"],
          "Classical" => ["103", "3003"],
          "EDM / Electronic" => ["103", "3006"],
          "HipHop / Rap" => ["103", "3008"]
        },
        "Business" => {
          "Startups & Small Business" => ["101", "1001"],
          "Finance" => ["101", "1002"],
          "Real Estate" => ["101", "1005"],
          "Sales & Marketing" => ["101", "1007"]
        },
        "Film & Media" => {
          "Gaming" => ["104", "4004"],
          "Anime" => ["104", "4003"],
          "Film" => ["104", "4002"],
          "Comics" => ["104", "4005"]
        },
        "Science & Tech" => {
          "Medicine" => ["102", "2001"],
          "Science" => ["102", "2002"],
          "Biotech" => ["102", "2003"],
          "High Tech" => ["102", "2004"]
        }
      }
    }
    @eventbrite_categories["subcategories"].each do |key, value|
      puts key
      value.each do |k, v|
        puts v[1]

      end
    end

    # @eventbrite_main_categories = ["Music", "Business", "Film & Media", "Science & Tech"]
    # @eventbrite_sub_categories = eventbrite_sub_categories
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
  end
end

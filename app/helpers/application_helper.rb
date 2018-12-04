module ApplicationHelper

  def foursquare_api(category, near)

    base_url = "https://api.foursquare.com/v2/venues/"

    foursquare_response = Faraday.new(url: base_url) do |f|
      f.adapter :net_http
      f.response :json
    end

    response = foursquare_response.get("search/?", client_id: ENV['FOURSQUARE_ID'], client_secret: ENV['FOURSQUARE_SECRET'], near: near, categoryId: category, v: 20181202)
    body = response.body
    venues = body["response"]["venues"]
    venues_details = []
    venues.each do |venue|
      venues_details << { name: venue["name"], address: venue["location"]["address"]  }
    end
    return venues_details
  end

  def eventbrite_api(latitude, longitude, start_day, end_day, slug)
    base_url = "https://www.eventbriteapi.com/v3/events/"

    eventbrite_response = Faraday.new(url: base_url) do |f|
      f.adapter :net_http
      f.response :json
    end

    response = eventbrite_response.get("search/?", token: ENV['EVENTBRITE'], "location.latitude" => latitude, "location.longitude" => longitude, "location.within" => "2mi", expand: "venue", "start_date.range_start" => start_day, "start_date.range_end" => end_day, categories: slug)
    events = response.body["events"]
    events_details = []
    events.each do |event|
      events_details << { name: event["name"]["text"], latitude: event["venue"]["latitude"], longitude: event["venue"]["longitude"] }
    end
  end

  eventbrite_category_name = ["Music", "Business", "Film & Media", "Science & Tech"]
  eventbrite_category_id = ["103", "101", "104", "102"]
  eventbrite_subcategory_music = ["3002", "3003", "3006", "3008"]
  eventbrite_subcategory_business = ["1001", "1002", "1005", "1007"]
  eventbrite_subcategory_film = ["4004", "4003", "4002", "4005"]
  eventbrite_subcategory_science = ["2001", "2002", "2003", "2004"]
end

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
      venues_details << { name: venue["name"], address: venue["location"]["address"] }
    end

    return venues_details
  end

  def eventbrite_api(latitude, longitude, start_day, end_day, category, sub)
    base_url = "https://www.eventbriteapi.com/v3/events/"

    eventbrite_response = Faraday.new(url: base_url) do |f|
      f.adapter :net_http
      f.response :json
    end

    response = eventbrite_response.get("search/?", token: ENV['EVENTBRITE'], "location.latitude" => latitude, "location.longitude" => longitude, "location.within" => "20mi", expand: "venue", "start_date.range_start" => start_day, "start_date.range_end" => end_day, categories: category, subcategories: sub)
    events = response.body["events"]
    events_details = []
    events.each do |event|
      events_details << { name: event["name"]["text"], latitude: event["venue"]["latitude"], longitude: event["venue"]["longitude"], event_start: event["start"]["local"],event_end: event["end"]["local"] }
    end
    return events_details
  end

  def eventbrite_sub_categories
    @eventbrite_sub_categories = {
      "Jazz & Blues" => ["103", "3002"],
      "Classical" => ["103", "3003"],
      "EDM / Electronic" => ["103", "3006"],
      "HipHop / Rap" => ["103", "3008"],
      "Startups & Small Business" => ["101", "1001"],
      "Finance" => ["101", "1002"],
      "Real Estate" => ["101", "1005"],
      "Sales & Marketing" => ["101", "1007"],
      "Gaming" => ["104", "4004"],
      "Anime" => ["104", "4003"],
      "Film" => ["104", "4002"],
      "Comics" => ["104", "4005"],
      "Medicine" => ["102", "2001"],
      "Science" => ["102", "2002"],
      "Biotech" => ["102", "2003"],
      "High Tech" => ["102", "2004"]
    }
    return @eventbrite_sub_categories
  end
end

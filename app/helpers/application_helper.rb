module ApplicationHelper
  # eventbrite_categories = {
  #   "Music" => "103",
  #   "Business" => "101",
  #   "Food & Drink" => "110",
  #   "Community" => "113",
  #   "Arts" => "105",
  #   "Film & Media" => "104",
  #   "Sports & Fitness" => "108",
  #   "Health" => "107",
  #   "Science & Tech" => "102",
  #   "Travel & Outdoor" => "109",
  #   "Charity & Causes" => "111",
  #   "Spirituality" => "114",
  #   "Family & Education" => "115",
  #   "Seasonal & Holidy" => "116",
  #   "Government" => "112",
  #   "Fashion" => "106"
  # }

  def foursquare_api(query, price, section, near)
    base_url = "https://api.foursquare.com/v2/venues/"

    foursquare_response = Faraday.new(url: base_url) do |f|
      f.adapter :net_http
      f.response :json
    end

    response = foursquare_response.get("search/?", client_id: ENV['FOURSQUARE_ID'], client_secret: ENV['FOURSQUARE_SECRET'], near: near, query: query, categoryId: category, v: 20181202)
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
    raise
    events_details = []
    events.each do |event|
      events_details << { name: event["name"]["text"], latitude: event["venue"]["latitude"], longitude: event["venue"]["longitude"] }
    end
  end
end

module ApplicationHelper
  eventbrite_categories = {
    "Music" => "103",
    "Business" => "101",
    "Food & Drink" => "110",
    "Community" => "113",
    "Arts" => "105",
    "Film & Media" => "104",
    "Sports & Fitness" => "108",
    "Health" => "107",
    "Science & Tech" => "102",
    "Travel & Outdoor" => "109",
    "Charity & Causes" => "111",
    "Spirituality" => "114",
    "Family & Education" => "115",
    "Seasonal & Holidy" => "116",
    "Government" => "112",
    "Fashion" => "106"
  }

  def foursquare_api(query, price, section, near)
    # conn = Faraday.new(url: "https://api.foursquare.com/v2/venues
    #   /explore?near=#{city}&client_id=#{ENV['FOURSQUARE_ID']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20181202")
    base_url = "https://api.foursquare.com/v2/venues/"

    foursquare_response = Faraday.new(url: base_url) do |f|
      f.adapter :net_http
      f.response :json
    end

    response = foursquare_response.get("explore/?", client_id: ENV['FOURSQUARE_ID'], client_secret: ENV['FOURSQUARE_SECRET'], near: :city, query: query, price: price, section: section)
    raise
    events_trip = []
    parsed_response.each do |event|
    end
  end

end

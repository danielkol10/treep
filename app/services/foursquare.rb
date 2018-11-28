require 'rest-client'
require 'json'

BASE_URL = "https://api.foursquare.com/v2/venues"

class FourSquare
 def initialize(args)
   @client_id = args[:client_id]
   @client_secret = args[:client_secret]
 end

 def search_venues(coord_query)
   url = BASE_URL + "/search?ll=#{coord_query}&client_id=#{@client_id}&client_secret=#{@client_secret}&v=20180323"
   response = RestClient.get(url)
   JSON.parse(response)['response']['venues']
 end

 def venue_detail(venues)
   venues.each do |venue|
     url = BASE_URL + "/#{venue['id']}&client_id=#{@client_id}&client_secret=#{@client_secret}&v=20180323"
     venue = RestClient.get(url)
     JSON.parse(venue)
   end
 end
end

=begin=endll = 44.3,37.2


venues = foursquare.search_venues
foursquare.venue_detail(venues)

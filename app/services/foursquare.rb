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

# ll = 44.3,37.2

# method for cutting down decimals after first float

#   def round_down(n=0)
#     int,dec=self.to_s.split('.')
#     "#{int}.#{dec[0...n]}".to_f
#   end

# 1.9991.round_down(3)
#  => 1.999
# 1.9991.round_down(2)
#  => 1.99
# 1.9991.round_down(0)
#  => 1.0
# 1.9991.round_down(10)
#  => 1.9991

# venues = foursquare.search_venues
# foursquare.venue_detail(venues)

FoursquareCategory.destroy_all
EventbriteCategory.destroy_all
Venue.destroy_all
Event.destroy_all
Trip.destroy_all
User.destroy_all

foursquare_category = {
  "food" => "https://res.cloudinary.com/druzius/image/upload/v1543755687/pooja-chaudhary-633059-unsplash.jpg",
  "drinks" => "https://res.cloudinary.com/druzius/image/upload/v1543755688/alexander-popov-522100-unsplash.jpg",
  "arts" => "https://res.cloudinary.com/druzius/image/upload/v1543769862/ancient-ancient-civilization-arch-159862.jpg",
  "outdoors" => "https://res.cloudinary.com/druzius/image/upload/v1543755693/jared-rice-389056-unsplash.jpg"
}

foursquare_category.each do |cat, url|
  FoursquareCategory.create(name: cat, img_url: url)
end

eventbrite_category = {
  "Music" => "103",
  "Business" => "101",
  "Seasonal & Holiday" => "116",
  "Science & Tech" => "102"
}

eventbrite_category.each do |cat, slug|
  EventbriteCategory.create(name: cat, name_slug: slug)
end

eventbrite_category_name = ["Music", "Business", "Film & Media", "Science & Tech"]
eventbrite_category_id = ["103", "101", "104", "102"]
eventbrite_subcategory_music = ["3002", "3003", "3006", "3008"]
eventbrite_subcategory_business = ["1001", "1002", "1005", "1007"]
eventbrite_subcategory_film = ["4004", "4003", "4002", "4005"]
eventbrite_subcategory_science = ["2001", "2002", "2003", "2004"]


# eventbrite_category_subcategories = [
#   "Music" {
#     "Blues & Jazz" => "3002",
#     "Classical" => "3003",
#     "EDM / Electronic" => "3006",
#     "Hip Hop / Rap" => "3008"
#   }

#   "Business" {
#     "Startups & Small Business" => "1001",
#     "Finance" => "1002",
#     "Real Estate" => "1005",
#     "Sales & Marketing" => "1007"
#   }

#   "Film & Media" {
#     "Gaming" => "4004"
#     "Anime" => "4003"
#     "Film" => "4002"
#     "Comics" => "4005"
#   }

#   "Science & Tech" {
#     "Medicine" => "2001"
#     "Science" => "2002"
#     "Biotech" => "2003 "
#     "High Tech" => "2004"
#   }
# ]






10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

users = User.all



trip = Trip.create!(
  city: "London",
  start_day: Date.new(2019,2,3),
  end_day: Date.new(2019,2,19),
  user_id: users[0].id
)

trip = Trip.create!(
  city: "New York",
  start_day: Date.new(2019,3,3),
  end_day: Date.new(2019,3,28),
  user_id: users[0].id
)

trips = Trip.all

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,7,9),
  event_end: DateTime.new(2019,2,7,12),
  trip_id: trips[0].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,9,13),
  event_end: DateTime.new(2019,2,9,15),
  trip_id: trips[0].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,9,14),
  event_end: DateTime.new(2019,2,9,18),
  trip_id: trips[0].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,9,17),
  event_end: DateTime.new(2019,3,9,19),
  trip_id: trips[1].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,9,18),
  event_end: DateTime.new(2019,3,9,20),
  trip_id: trips[1].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,12,9),
  event_end: DateTime.new(2019,3,12,13),
  trip_id: trips[1].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,15,14),
  event_end: DateTime.new(2019,2,15,18),
  trip_id: trips[1].id
  )

events = Event.create(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,21,14),
  event_end: DateTime.new(2019,3,21,19),
  trip_id: trips[1].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1200",
  open_end: "1800",
  location:  "10 Oxford Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "2100",
  open_end: "0600",
  location:  "25 High Street Kensington, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1700",
  open_end: "2200",
  location:  "52 Baker Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1000",
  open_end: "2000",
  location:  "175 Oxford Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "0800",
  open_end: "1300",
  location:  "72 Harley Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "0900",
  open_end: "1700",
  location:  "12 Covent Gardens, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1000",
  open_end: "1700",
  location:  "56 Wilson Road, Ridgewood, New York 11385",
  trip_id: trips[1].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1200",
  open_end: "0000",
  location:  "850 Beach Street Brooklyn, New York 11223",
  trip_id: trips[1].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1000",
  open_end: "2200",
  location:  "288 High Noon Court Bronx, New York 10456",
  trip_id: trips[1].id
  )

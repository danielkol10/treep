FoursquareCategory.destroy_all
Venue.destroy_all
Event.destroy_all
Trip.destroy_all
User.destroy_all

foursquare_category = {
  "burger" => "4bf58dd8d48988d16c941735",
  "asian" => "4bf58dd8d48988d142941735",
  "middle_eastern" => "4bf58dd8d48988d115941735",
  "italian" => "4bf58dd8d48988d110941735",
  "pub" => "4bf58dd8d48988d11b941735",
  "nightclub" => "4bf58dd8d48988d11f941735",
  "other_nightlife" => "4bf58dd8d48988d11a941735",
  "nightmarket" => "53e510b7498ebcb1801b55d4",
  "art_gallery" => "4bf58dd8d48988d1e2931735",
  "historic_site" => "4deefb944765f83613cdba6e",
  "street_art" => "52e81612bcbc57f1066b79ee",
  "theater" => "4bf58dd8d48988d137941735",
  "national_parks" => "52e81612bcbc57f1066b7a21",
  "trail" => "4bf58dd8d48988d159941735",
  "gym" => "4bf58dd8d48988d176941735",
  "scenic_lookout" => "4bf58dd8d48988d165941735"
}

foursquare_category.each do |category, id|
  FoursquareCategory.create!(name: category, category_id: id)
end

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

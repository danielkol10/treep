# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Venue.destroy_all
Event.destroy_all
Trip.destroy_all
User.destroy_all
TripCategory.destroy_all
Trip.destroy_all
Category.destroy_all

categories = {
  Italian: ["4bf58dd8d48988d110941735"],
  Japanese: ["4bf58dd8d48988d111941735"],
  Chinese: ["4bf58dd8d48988d111941735"],
  Mediterranean: ["4bf58dd8d48988d1c0941735"],
  Burger: ["4bf58dd8d48988d16c941735"],
  Mexican: ["4bf58dd8d48988d1c1941735"],

  Nightclubs: ["4bf58dd8d48988d11f941735"],
  Bars: ["4bf58dd8d48988d116941735"],
  Classical: ["4bf58dd8d48988d136941735","4bf58dd8d48988d137941735"],
  Calm: ["4bf58dd8d48988d102941735"],
  karaoke: ["4bf58dd8d48988d120941735"],
  music_venues: ["4bf58dd8d48988d1e5931735"],

  hidden_gems: ["52e81612bcbc57f1066b7a30"],
  famous_monuments: ["4bf58dd8d48988d12d941735"],
  adrenaline: ["4bf58dd8d48988d182941735", "4bf58dd8d48988d193941735", "52e81612bcbc57f1066b79ea"],
  family: ["4bf58dd8d48988d17b941735", "4bf58dd8d48988d182941735", "4bf58dd8d48988d193941735", "52e81612bcbc57f1066b79e6", "52e81612bcbc57f1066b79eb"],

  Art_Musuem: ["4bf58dd8d48988d18f941735"],
  History_musuem: ["4bf58dd8d48988d190941735"],
  Science_musuem: ["4bf58dd8d48988d191941735","4bf58dd8d48988d192941735"],
  street_art: ["507c8c4091d498d9fc8c67a9"],

  Low_Budget: ["cheap"],
  Regular: ["regular"],
  Luxury: ["luxury"]
}


categories.each do |category, serials|
    Category.create!(name: category.to_s.humanize, serials: serials )
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
  number_of_people: 1,
  budget: "500-1000",
  category: "Culture",
  user_id: users[0].id
)

trip = Trip.create!(
  city: "New York",
  start_day: Date.new(2019,3,3),
  end_day: Date.new(2019,3,28),
  number_of_people: 2,
  budget: "1000-1500",
  category: "Culture",
  user_id: users[0].id
)

trips = Trip.all

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,7,9),
  event_end: DateTime.new(2019,2,7,12),
  trip_id: trips[0].id,
  latitude: "51.49",
  longitude: "0.17"
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,9,13),
  event_end: DateTime.new(2019,2,9,15),
  trip_id: trips[0].id,
  latitude: "51.55",
  longitude: "0.06"
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,9,14),
  event_end: DateTime.new(2019,2,9,18),
  trip_id: trips[0].id,
  latitude: "51.46",
  longitude: "0.11"
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,9,17),
  event_end: DateTime.new(2019,3,9,19),
  trip_id: trips[1].id,
  latitude: "40.77",
  longitude: "73.95"
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,9,18),
  event_end: DateTime.new(2019,3,9,20),
  trip_id: trips[1].id,
  latitude: "40.77",
  longitude: "73.95"
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,12,9),
  event_end: DateTime.new(2019,3,12,13),
  trip_id: trips[1].id,
  latitude: "40.72",
  longitude: "73.99"
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,15,14),
  event_end: DateTime.new(2019,2,15,18),
  trip_id: trips[1].id,
  latitude: "40.78",
  longitude: "73.96"
  )

events = Event.create(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,21,14),
  trip_id: trips[1].id,
  latitude: "40.78",
  longitude: "73.97"
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1200",
  open_end: "1800",
  days: [1, 2, 4, 5, 6, 7],
  location:  "10 Oxford Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "2100",
  open_end: "0600",
  days: [1, 2, 3, 5, 6],
  location:  "25 High Street Kensington, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1700",
  open_end: "2200",
  days: [6, 7],
  location:  "52 Baker Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1000",
  open_end: "2000",
  days: [1, 2, 3, 6, 7],
  location:  "175 Oxford Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "0800",
  open_end: "1300",
  days: [1, 2, 3, 4, 5],
  location:  "72 Harley Street, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "0900",
  open_end: "1700",
  days: "[1, 2, 3, 4, 5]",
  location:  "12 Covent Gardens, London",
  trip_id: trips[0].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1000",
  open_end: "1700",
  days: [1, 2, 3, 4, 5],
  location:  "56 Wilson Road, Ridgewood, New York 11385",
  trip_id: trips[1].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1200",
  open_end: "0000",
  days: [1, 4, 5, 6],
  location:  "850 Beach Street Brooklyn, New York 11223",
  trip_id: trips[1].id
  )

venue = Venue.create!(
  name: Faker::Company.name,
  open_start: "1000",
  open_end: "2200",
  days: [1, 2, 3, 4, 5],
  location:  "288 High Noon Court Bronx, New York 10456",
  trip_id: trips[1].id
  )

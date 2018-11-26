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
  location: "77 Hamilton Terrace, London",
  trip_id: trips[0].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,9,13),
  event_end: DateTime.new(2019,2,9,15),
  location: "15 Hyde Park Square, London",
  trip_id: trips[0].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,9,14),
  event_end: DateTime.new(2019,2,9,18),
  location: "32 Oxford Street, London",
  trip_id: trips[0].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,9,17),
  event_end: DateTime.new(2019,3,9,19),
  location: "920 Sunnyslope Ave. Bronx, New York 10469",
  trip_id: trips[1].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,9,18),
  event_end: DateTime.new(2019,3,9,20),
  location: "254 Pheasant St. Corona, New York 11368",
  trip_id: trips[1].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,12,9),
  event_end: DateTime.new(2019,3,12,13),
  location: "7516 Boston Rd. Brooklyn, New York 11237",
  trip_id: trips[1].id
  )

events = Event.create!(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,2,15,14),
  event_end: DateTime.new(2019,2,15,18),
  location: "757 Cleveland St. Levittown, New York 11756",
  trip_id: trips[1].id
  )

events = Event.create(
  name: Faker::Hacker.abbreviation,
  event_start: DateTime.new(2019,3,21,14),
  event_end: DateTime.new(2019,3,21,19),
  location: "399 Devonshire Drive. Rome, New York, 3440",
  trip_id: trips[1].id
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

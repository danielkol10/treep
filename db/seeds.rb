# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
Venue.destroy_all
TripCategory.destroy_all
Trip.destroy_all
Category.destroy_all

categories = %w(Italian Japanese Chinese Mediterranean Burger Local
                Nightclubs Bars Classical Calm karaoke music\ venues
                hidden\ gems famous\ monuments adrenaline family
                Art\ Musuem History\ musuem Science\ musuem street\ art)
categories.each do |category|
  Category.create!(name: category)
end

class Trip < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :venues
  acts_as_taggable_on :tags

  has_many :trip_categories
  has_many :categories, through: :trip_categories

  # CATEGORIES = {
  #   food: ["Italian", "Local", "Asian", "Mediterranean", "burgers", "sushi", "seafood"],
  #   type: ["luxury", "budget", "regular"],
  #   night: ["Nightclubs", "Bars", "Classical", "Calm", "karaoke", "music venues"],
  #   activites: ["hidden gems", "famous monuments", "adrenaline", "family"],
  #   musuems: ["Art Musuem", "History musuem", "Science musuem", "street art"]
  # }
end

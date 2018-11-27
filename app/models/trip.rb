class Trip < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  belongs_to :user
  has_many :events
  has_many :venues
  acts_as_taggable_on :categories
end

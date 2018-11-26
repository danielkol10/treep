class Trip < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :venues
  acts_as_taggable_on :categories


end

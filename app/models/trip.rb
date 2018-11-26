class Trip < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :venues
end

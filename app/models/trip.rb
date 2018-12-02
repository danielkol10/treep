class Trip < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  belongs_to :user
  has_many :events
  has_many :venues

  def get_coord
    "#{self.latitude},#{self.longitude}"
  end
end

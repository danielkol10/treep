class Venue < ApplicationRecord
  enum days: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  belongs_to :trip
end

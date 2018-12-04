class Venue < ApplicationRecord
  VENUE_CARD_IMAGES = ['https://res.cloudinary.com/druzius/image/upload/v1543755687/pooja-chaudhary-633059-unsplash.jpg',
                       'https://res.cloudinary.com/druzius/image/upload/v1543755688/alexander-popov-522100-unsplash.jpg',
                       'https://res.cloudinary.com/druzius/image/upload/v1543769862/ancient-ancient-civilization-arch-159862.jpg',
                       'https://res.cloudinary.com/druzius/image/upload/v1543755693/jared-rice-389056-unsplash.jpg']
  belongs_to :trip
end

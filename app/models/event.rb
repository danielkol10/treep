class Event < ApplicationRecord
  EVENT_CARD_IMAGES = [
    'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933435/music.jpg',
   'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933434/business.jpg',
   'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933437/film-media.jpg',
   'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543935226/science-tech.jpg']

  EVENTBRITE_SUB_CATEGORY_IMAGES = {
    "3002" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543932418/jazz-blues.jpg",
    "3003" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543932416/classical.jpg",
    "3006" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543932420/electronic.jpg",
    "3008" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543932419/hiphop-rap.jpg",
    "1001" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933429/start-up.jpg",
    "1002" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933430/finance.jpg",
    "1007" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933430/real-estate.jpg",
    "1005" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543933438/sales-marketing.jpg",
    "4004" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543935036/gaming.jpg",
    "4003" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934741/anime.jpg",
    "4002" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934745/film.jpg",
    "4005" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934741/comics.jpg",
    "2001" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934738/medicine.jpg",
    "2002" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934740/science.jpg",
    "2003" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934737/Biotech.jpg",
    "2004" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543934742/hightech.jpg"
  }
  belongs_to :trip
end

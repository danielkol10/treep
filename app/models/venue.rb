class Venue < ApplicationRecord
  VENUE_CARD_IMAGES = ['https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_2260/v1543755687/pooja-chaudhary-633059-unsplash.jpg',
                       'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1688/v1543755688/alexander-popov-522100-unsplash.jpg',
                       'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1377/v1543755693/jared-rice-389056-unsplash.jpg',
                       'https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1763/v1543769862/ancient-ancient-civilization-arch-159862.jpg']

  FOURSQUARE_CATEGORY_IMAGES = {
  "4bf58dd8d48988d16c941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1683/v1543930000/burger.jpg",
  "4bf58dd8d48988d142941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1593/v1543930137/asian.jpg",
  "4bf58dd8d48988d115941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543930000/middle-eastern.jpg",
  "4bf58dd8d48988d110941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1572/v1543929998/italian.jpg",
  "4bf58dd8d48988d11b941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1626/v1543930002/pub.jpg",
  "4bf58dd8d48988d11f941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1526/v1543929998/club.jpg",
  "4bf58dd8d48988d11a941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1572/v1543930001/other-nightlife.jpg",
  "53e510b7498ebcb1801b55d4" => "https://res.cloudinary.com/druzius/image/upload/q_auto:eco/v1543929997/nightmarket.jpg",
  "4bf58dd8d48988d1e2931735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543929999/art-gallery.jpg",
  "4deefb944765f83613cdba6e" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1563/v1543929999/historic-site.jpg",
  "52e81612bcbc57f1066b79ee" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1674/v1543769209/timon-klauser-308449-unsplash.jpg",
  "4bf58dd8d48988d137941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1491/v1543930951/theater.jpg",
  "52e81612bcbc57f1066b7a21" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1780/v1543930953/national-parks.jpg",
  "4bf58dd8d48988d159941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1505/v1543930952/trail.jpg",
  "4bf58dd8d48988d176941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1568/v1543930952/gym.jpg",
  "4bf58dd8d48988d165941735" => "https://res.cloudinary.com/druzius/image/upload/c_scale,q_auto:eco,w_1545/v1543930950/scenic-lookout.jpg"
  }
  belongs_to :trip
end

import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Melbourne", "Kathmandu",
     "Cape Town", "Havana",
      "Singapore", "Rome",
       "Buenos Aires", "Tel Aviv",
        "London", "Vienna",
         "Prague", "Chiang Mai",
          "Tokyo", "Bali",
           "Berlin", "Istanbul"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };

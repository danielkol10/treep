import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["The World", "Bhutan",
     "Cape Town", "Havana",
      "Singapore", "Rome",
       "Paris", "Tel Aviv",
        "London", "Vienna",
         "Prague", "Chiang Mai",
          "Tokyo", "Bali",
           "Berlin", "Istanbul"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };

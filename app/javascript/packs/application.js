import "bootstrap";
import { timeLine } from '../components/timeline';
timeLine();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();
import "../plugins/flatpickr"
import { activeChoice } from '../components/category_choice';
activeChoice();
import  '../components/navbar';
initUpdateNavbarOnScroll();
import { dropDown } from'../components/dropdown';

dropDown();


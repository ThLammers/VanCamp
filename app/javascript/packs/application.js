import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete, initAutocomplete2 } from '../plugins/init_autocomplete';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();
// initAutocomplete();
initAutocomplete2();

import places from 'places.js';

// DO WE NEED THIS CODE? (@thilo)
const initAutocomplete = () => {
  const locationInput = document.getElementById('van_location');
  if (locationInput) {
    places({ container: addressInput });
  }
};

const initAutocomplete2 = () => {
  var placesAutocomplete = places({
    appId: "plD6EDOEKH3Y",
    apiKey: "6c471793fdac6f021f621dcd093a354c",
    container: document.querySelector('#address-input')
  });
}

export { initAutocomplete, initAutocomplete2 };

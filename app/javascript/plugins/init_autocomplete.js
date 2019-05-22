import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('van_location');
  if (locationInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };

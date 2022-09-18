import TwCitySelector from 'tw-city-selector/dist/tw-city-selector'

document.addEventListener('turbo:load', () => {
  var tcs = new TwCitySelector({
    el: '.city-selector',
    elCounty: '.county',
    elDistrict: '.district',
    countyFieldName: 'store[county]',
    districtFieldName: 'store[district]',
  });
})
// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false
import "./controllers"
import "./controllers/sortable"
import "./controllers/bootstrap"
import * as bootstrap from "bootstrap"
import "@fortawesome/fontawesome-free/js/all"
import TwCitySelector from 'tw-city-selector/dist/tw-city-selector'

var tcs = new TwCitySelector({
  el: '.city-selector',
  elCounty: '.county',
  elDistrict: '.district',
});


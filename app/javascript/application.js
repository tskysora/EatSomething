// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false
import "./controllers"
import "./vendor/index.js"
// import * as bootstrap from "bootstrap"
window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
import "@fortawesome/fontawesome-free/js/all"

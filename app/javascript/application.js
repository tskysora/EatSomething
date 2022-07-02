// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false

import "./controllers"
import * as bootstrap from "bootstrap"
import Collapse from 'bootstrap/js/dist/collapse'

function collapseMobileHandler() {
  const collapseMobile = document.getElementById("sidebar-mobile-collapse");
  const collapseBtnMobile = document.getElementById("sidebar-mobile-collapse-btn");
  const sidebarIconMobile = document.getElementById("sidebar-mobile-icon");

  // 初始化下拉選單
  const bsCollapseMobile = new Collapse(collapseMobile, {
    toggle: false
  });

  collapseBtnMobile.addEventListener("click", function () {
    bsCollapseMobile.toggle();
  });
  collapseMobile.addEventListener("show.bs.collapse", function () {
    sidebarIconMobile.classList.add("transform-rotate-90");
  });
  collapseMobile.addEventListener("hide.bs.collapse", function () {
    sidebarIconMobile.classList.remove("transform-rotate-90");
  });
}

collapseMobileHandler();
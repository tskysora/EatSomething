// import "@hotwired/turbo-rails"
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false
// import * as bootstrap from "bootstrap"
import Collapse from 'bootstrap/js/dist/collapse'

function collapseMobileHandler() {
  const collapseMobile = document.getElementById("sidebar-mobile-collapse");
  const collapseBtnMobile = document.getElementById("sidebar-mobile-collapse-btn");
  const sidebarIconMobile = document.getElementById("sidebar-mobile-icon");

  // 初始化下拉選單
  const bsCollapseMobile = new Collapse(collapseMobile, {
    toggle: true
  });

  collapseBtnMobile.addEventListener("click", function () {
    bsCollapseMobile.toggle();
  });
  collapseMobile.addEventListener("show.bs.collapse", function () {
    sidebarIconMobile.classList.remove("bi-chevron-right");
    sidebarIconMobile.classList.add("bi-chevron-down");
  });
  collapseMobile.addEventListener("hide.bs.collapse", function () {
    sidebarIconMobile.classList.remove("bi-chevron-down");
    sidebarIconMobile.classList.add("bi-chevron-right");
  });
}

collapseMobileHandler();
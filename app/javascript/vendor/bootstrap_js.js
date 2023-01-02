import Collapse from 'bootstrap/js/dist/collapse'
import Toast from 'bootstrap/js/dist/toast'

document.addEventListener('turbo:load', () => {
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
  
  function copyToastHandler() {
    const toastTrigger = document.getElementById('copy-url-btn')
    const toastLiveExample = document.getElementById('toast-view')
    if (toastTrigger) {
      toastTrigger.addEventListener('click', () => {
        const toast = new bootstrap.Toast(toastLiveExample)
        toast.show()
      })
    }
  }

  function regenerateToastHandler() {
    const toastTrigger = document.getElementById('regenerate-btn')
    const toastLiveExample = document.getElementById('toast-view')
    if (toastTrigger) {
      toastTrigger.addEventListener('click', () => {
        const toast = new bootstrap.Toast(toastLiveExample)
        toast.show()
      })
    }
  }
  
  // collapseMobileHandler();
  copyToastHandler();
  regenerateToastHandler();
})
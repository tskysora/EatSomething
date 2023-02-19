import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "templateTray", "addTrayBtn" ]

  add_tray_item(event){
    event.preventDefault();

    let content = this.templateTrayTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.addTrayBtnTarget.insertAdjacentHTML('beforebegin', content);
  }
  
  remove_tray(event) {
    event.preventDefault();

    let wrapper = event.target.closest('.nested-tray-fields');
    if (wrapper.dataset.newRecord == 'true') {
      wrapper.remove();
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1;
      wrapper.style.display = 'none';
    }
  }
}

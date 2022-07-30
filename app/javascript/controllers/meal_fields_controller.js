import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "template", "addBtn" ]

  add_meal(event){
    event.preventDefault();
    let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.addBtnTarget.insertAdjacentHTML('beforebegin', content);
  }

  remove_meal(event){
    event.preventDefault();
      
    let wrapper = event.target.closest('.nested-fields');
    if (wrapper.dataset.newRecord == 'true') {
      wrapper.remove();
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1;
      wrapper.style.display = 'none';
    }
    }

}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["userEmailInput", "userIdInput"]

  transfer_manager(event){
    event.preventDefault();
    console.log('hi');
  }
  
}

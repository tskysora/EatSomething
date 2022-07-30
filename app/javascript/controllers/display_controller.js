import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["storeEdit", "mealEdit", "submit", "storeCard", "mealCard"]

  show_store_edit(event){
    event.preventDefault();
    this.storeEditTarget.classList.remove("d-none");
    this.submitTarget.classList.remove("d-none");
    this.storeCardTarget.classList.add("d-none");
    this.mealCardTarget.classList.add("d-none");
  }
  
  show_meal_edit(event){
    event.preventDefault();
    this.mealEditTarget.classList.remove("d-none");
    this.submitTarget.classList.remove("d-none");
    this.storeCardTarget.classList.add("d-none");
    this.mealCardTarget.classList.add("d-none");
  }
  
  show_store_card(event){
    event.preventDefault();
    this.storeEditTarget.classList.add("d-none");
    this.storeCardTarget.classList.remove("d-none");
    this.submitTarget.classList.add("d-none");
    this.mealCardTarget.classList.remove("d-none");
  }

  show_meal_card(event){
    event.preventDefault();
    this.mealEditTarget.classList.add("d-none");
    this.mealCardTarget.classList.remove("d-none");
    this.submitTarget.classList.add("d-none");
    this.storeCardTarget.classList.remove("d-none");
  }
}

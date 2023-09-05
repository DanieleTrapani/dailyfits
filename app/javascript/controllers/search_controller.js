import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["location", "form"]

  toggle() {
    this.formTarget.classList.toggle("d-none")
    this.locationTarget.classList.toggle("d-none")
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-outfits"
export default class extends Controller {
  static targets = ["modifybutton", "buttonlists", "hint"]

  connect() {
    // console.log("hello, connect")
    // console.log(this.modifybuttonTarget)
    // console.log(this.buttonlistsTarget)
  }

  modify() {
    // console.log(this.buttonlistsTarget)
    this.buttonlistsTarget.classList.toggle("d-none")
  }
}

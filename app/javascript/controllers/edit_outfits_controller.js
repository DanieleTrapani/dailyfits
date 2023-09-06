import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-outfits"
export default class extends Controller {
  static targets = ["togglebutton", "buttonlists", "editbutton", "text", "form"]

  connect() {
    console.log("hello, connect")
    // console.log(this.modifybuttonTarget)
    // console.log(this.buttonlistsTarget)
  }

  toggle() {
    event.preventDefault()
    console.log("hello, toglle")
    // console.log(this.buttonlistsTarget)
    this.buttonlistsTarget.classList.toggle("d-none")
  }

  edit(){
    event.preventDefault()
    console.log("hello, edit")
    // console.log(this.textTarget)
    // console.log(this.formTarget)
    this.textTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}

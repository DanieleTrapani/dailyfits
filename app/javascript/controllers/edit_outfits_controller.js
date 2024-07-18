import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="edit-outfits"
export default class extends Controller {
  static targets = [
    "togglebutton",
    "buttonlists",
    "editbutton",
    "text",
    "form",
  ];

  connect() {}

  toggle() {
    event.preventDefault();
    this.buttonlistsTarget.classList.toggle("d-none");
  }

  edit() {
    event.preventDefault();
    this.textTarget.classList.add("d-none");
    this.formTarget.classList.remove("d-none");
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "input" ]

  connect() {
    // this.element.textContent = "Hello World!"
  }
  
  update(event) {
    this.inputTarget.innerHTML = "<i class='fa-solid fa-image pr-3' aria-hidden='true'></i>" +  event.target.files[0].name
  }
}

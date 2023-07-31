import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['form']
  
  connect() {
    // this.element.textContent = "Hello World!"
  }

  submitOnChange(event) {
    event.target.closest("form").requestSubmit()
  }

  selectAll(event) {
    event.target.closest("form").querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
      checkbox.checked = true
    })
  }

}

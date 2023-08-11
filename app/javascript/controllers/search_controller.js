import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['form']
  
  connect() {
    // this.element.textContent = "Hello World!"
  }

  submit(event) {
    event.target.closest("form").requestSubmit()
  }

  selectAll(event) {
    event.target.closest("div").querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
      checkbox.checked = true
    })
  }

  selectOnly(event) {
    console.log('work')
    event.target.parentElement.parentElement.closest("div").querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
      checkbox.checked = false
    })
    event.target.parentElement.closest("div").querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
      checkbox.checked = true
    })
   
  }

  moveCursorToEnd(event) {
    let element = event.target;
    element.setSelectionRange(element.value.length, element.value.length);
  }

  clearQuery(event) {
    event.target.closest("form").querySelector('input[name="query"]').value = ""
  }
  

}

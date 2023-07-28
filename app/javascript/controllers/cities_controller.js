import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  
  static targets = ['cities_select']
  
  connect() {
    // this.element.textContent = "Hello World!"
    // console.log(this.name_inputTarget)
    // console.log(this.state_inputTarget)
  }

  update_state(event) {
    get("/app/cities/filter?target="+ this.cities_selectTarget.id + "&state=" + event.target.value, {
      responseKind: "turbo-stream",
    })
  }
}

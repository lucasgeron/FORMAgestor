import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  
  static targets = ['courses_select', 'negotiations_select']
  
  
  connect() {
    // this.element.textContent = "Hello World!"
    // console.log(this.courses_selectTarget)
    // console.log(this.negotiations_selectTarget)
  }

  update_courses(event) {
    get("/app/courses/filter?target="+ this.courses_selectTarget.id + "&institution=" + event.target.value, {
      responseKind: "turbo-stream",
    })
  }

  update_negotiations(event) {
    get("/app/negotiations/filter?target="+ this.negotiations_selectTarget.id + "&course=" + event.target.value, {
      responseKind: "turbo-stream",
    })
  }
}

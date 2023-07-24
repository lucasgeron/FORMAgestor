import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['subject', 'message']

  connect() {
    // console.log("connected")
  }

  fill_form_with(event) {
    let plan = event.currentTarget.getAttribute('data-contact-plan')
    let subject = event.currentTarget.getAttribute('data-contact-subject')
    let message = event.currentTarget.getAttribute('data-contact-message')

    this.set_subject(plan+" - "+subject)
    this.set_message(message)
  }


  set_subject(subject) {
    this.subjectTarget.value = subject
  }

  set_message(message) {
    this.messageTarget.value = message
  }

}

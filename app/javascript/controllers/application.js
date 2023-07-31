import { Application } from "@hotwired/stimulus"
import Notification from 'stimulus-notification'
import ScrollTo from 'stimulus-scroll-to'
import TextareaAutogrow from 'stimulus-textarea-autogrow'
import Reveal from 'stimulus-reveal-controller'


const application = Application.start()
application.register('notification', Notification)
application.register('scroll-to', ScrollTo)
application.register('textarea-autogrow', TextareaAutogrow)
application.register('reveal', Reveal)

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

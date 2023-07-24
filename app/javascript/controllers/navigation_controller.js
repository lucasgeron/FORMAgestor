window.class_list = []
window.class_list.push("ACTIVE_LINK")
window.class_list.push("text-white")
window.class_list.push("bg-blue-600")
window.class_list.push("hover:text-white")
window.class_list.push("hover:bg-blue-700")
window.class_list.push("dark:hover:bg-blue-700")

import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["home_sec", "about_sec", "faq_sec", "services_sec", "updates_sec", "pricing_sec", "contact_sec",
    "home_link", "about_link", "faq_link", "services_link", "updates_link", "pricing_link", "contact_link",
    "newsletter_sec"]

  static home_sec = 0;
  static about_sec = 0;
  static faq_sec = 0;
  static services_sec = 0;
  static updates_sec = 0;
  static pricing_sec = 0;
  static contact_sec = 0;
  static newsletter_sec = 0;

  static links = []
  static current_link = ""



  initialize() {

    let gap = 200 // gap between top of page and section - consider the flow of scrolling
    setTimeout(() => {
      this.constructor.home_sec = this.home_secTarget.offsetTop - gap
      this.constructor.about_sec = this.about_secTarget.offsetTop - gap
      this.constructor.faq_sec = this.faq_secTarget.offsetTop - gap
      this.constructor.services_sec = this.services_secTarget.offsetTop - gap
      this.constructor.updates_sec = this.updates_secTarget.offsetTop - gap
      this.constructor.pricing_sec = this.pricing_secTarget.offsetTop - gap
      this.constructor.contact_sec = this.contact_secTarget.offsetTop - gap
      this.constructor.newsletter_sec = this.newsletter_secTarget.offsetTop - gap

      this.constructor.links.push(this.home_linkTarget)
      this.constructor.links.push(this.about_linkTarget)
      this.constructor.links.push(this.faq_linkTarget)
      this.constructor.links.push(this.services_linkTarget)
      this.constructor.links.push(this.updates_linkTarget)
      this.constructor.links.push(this.pricing_linkTarget)
      this.constructor.links.push(this.contact_linkTarget)

      this.clearClasses()


      this.handleScroll(),
        200
    })
  }

  connect() {
    window.addEventListener('scroll', this.handleScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll.bind(this))
  }



  handleScroll() {

    // console.log(window.scrollY)
    // console.log(this.constructor.current_link)

    switch (true) {

      // CASE HOME
      case (window.scrollY <= this.constructor.about_sec):
        this.constructor.current_link = "home_link"
        this.addClassesToTarget(this.home_linkTarget)
        this.removeClassesFromTarget(this.about_linkTarget)
        break;

      // CASE ABOUT
      case (window.scrollY <= this.constructor.services_sec):
        this.constructor.current_link = "about_link"
        this.addClassesToTarget(this.about_linkTarget)
        this.removeClassesFromTarget(this.home_linkTarget)
        this.removeClassesFromTarget(this.services_linkTarget)
        break;

      // CASE SERVICES
      case (window.scrollY <= this.constructor.faq_sec):
        this.constructor.current_link = "services_link"
        this.addClassesToTarget(this.services_linkTarget)
        this.removeClassesFromTarget(this.about_linkTarget)
        this.removeClassesFromTarget(this.faq_linkTarget)
        break;

      // CASE FAQ
      case (window.scrollY <= this.constructor.updates_sec):
        this.constructor.current_link = "faq_link"
        this.addClassesToTarget(this.faq_linkTarget)
        this.removeClassesFromTarget(this.updates_linkTarget)
        this.removeClassesFromTarget(this.services_linkTarget)
        break;

      // CASE UPDATES
      case (window.scrollY <= this.constructor.pricing_sec):
        this.constructor.current_link = "updates_link"
        this.addClassesToTarget(this.updates_linkTarget)
        this.removeClassesFromTarget(this.faq_linkTarget)
        this.removeClassesFromTarget(this.pricing_linkTarget)
        break;

      // CASE PRICING
      case (window.scrollY <= this.constructor.contact_sec):
        this.constructor.current_link = "pricing_link"
        this.removeClassesFromTarget(this.updates_linkTarget)
        this.removeClassesFromTarget(this.contact_linkTarget)
        this.addClassesToTarget(this.pricing_linkTarget)
        break;

      // CASE CONTACT
      case (window.scrollY > this.constructor.contact_sec):
        this.constructor.current_link = "contact_link"
        this.removeClassesFromTarget(this.pricing_linkTarget)
        this.addClassesToTarget(this.contact_linkTarget)
        break;
    }
  }

  // Add classes to an element
  addClassesToTarget(el) {
    if (!el.classList.contains("ACTIVE_LINK")) {
      window.class_list.forEach(element => {
        el.classList.add(element)
      });
    }
  }

  // Remove all classes from an element
  removeClassesFromTarget(el) {
    if (el.classList.contains("ACTIVE_LINK")) {
      window.class_list.forEach(element => {
        el.classList.remove(element)
      });
    }
  }

  // Remove all classes from all links
  clearClasses() {
    this.constructor.links.forEach(element => {
      window.class_list.forEach(el => {
        element.classList.remove(el)
      });
    });
  }


  scrollToContact() {
    // let position = window.scrollY
    let position = this.constructor.contact_sec + 110 // 110 is the height of the navbar
    // console.log("contact absolute position: " + position)
    setTimeout(() => {
      // console.log('scrolling to contact')
      window.scrollTo({ top: position, behavior: 'smooth' });
    }, 500)
  }

  scrollToNewsletter() {
    let position = this.constructor.newsletter_sec + 110 // 110 is the height of the navbar
    // console.log("newsletter absolute position: " + position)
    setTimeout(() => {
      // console.log('scrolling to newsletter')
      window.scrollTo({ top: position, behavior: 'smooth' });
    }, 500)
  }


}



import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "add_item"]

  connect(event) {
    this.addPassenger(event);
  }

  addPassenger(event) {
    const passenger = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().valueOf())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', passenger)
    console.log('passenger added')
  }

  removePassenger(event) {
    console.log(this.numberOfPassengers)
    if (this.numberOfPassengers > 1) {
      let item = event.target.closest(".passenger-info")
      item.querySelector("input[name*='_destroy']").value = 1
      item.classList.add('not-visible')
    }
  }

  get numberOfPassengers() {
    return document.querySelectorAll("[class='passenger-info']").length
  }
}

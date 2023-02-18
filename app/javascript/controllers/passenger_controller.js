import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template"]

  connect() {}

  addPassenger(event) {
    event.preventDefault();
    console.log('passenger added');
    const passengers = document.querySelector('.passengers');
    const template = document.querySelector('#passenger-info');
    const clone = template.content.cloneNode(true);
    passengers.appendChild(clone);
  }

  removePassenger() {
    
  }
}

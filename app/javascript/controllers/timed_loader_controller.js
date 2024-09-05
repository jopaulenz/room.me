import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timed-loader"
export default class extends Controller {

  static targets = ['loader', 'link']

  connect() {
    console.log('hello');
    setTimeout(() => {
      this.revealLink(this.loaderTarget, this.linkTarget)
    }, 3000);
  }

  revealLink(hide, reveal) {
    hide.classList.add('d-none');
    reveal.classList.remove('d-none');
  }
}

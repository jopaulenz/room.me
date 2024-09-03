import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delay"
export default class extends Controller {
  static values = {
    role: String
  }
  connect() {
    const userRole = this.roleValue;
    if (window.location.pathname === "/") {
      this.#redirectToPage("/choose_role", 4000);
    //   redirectToPage("/choose_role", 5000);
    // } else if (window.location.pathname === "/tutorial") {
    //   if (userRole === "host") {
    //     redirectToPage("/flatmates/:id", 5000);
    //   } else if (userRole === "flatmate") {
    //     redirectToPage("/hosts/:id", 5000);
    //   }
    } else if (window.location.pathname === "/success") {
      if (userRole === "host") {
        this.#redirectToPage("flatmates/:id", 4000);
      } else if (userRole === "flatmate") {
        this.#redirectToPage("/hosts/:id", 4000);
      }
    }
  }

  #redirectToPage(url, delay) {
    setTimeout(function() {
      window.location.href = url;
    }, delay);
  }
}

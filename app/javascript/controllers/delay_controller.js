import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delay"
export default class extends Controller {
  static values = {
    role: String
  }

  connect() {
    const userRole = this.roleValue;
    console.log("User Role from data-delay-role-value:", userRole); // Debugging

    if (window.location.pathname === "/") {
      if (!userRole) {
        this.#redirectToPage("/choose_role", 4000);
      } else if (userRole === "host") {
        this.#redirectToPage("/flatmates", 4000);
      } else if (userRole === "flatmate") {
        this.#redirectToPage("/hosts", 4000);
      }
    }
  }

  #redirectToPage(url, delay) {
    setTimeout(() => {
      window.location.href = url;
    }, delay);
  }
}

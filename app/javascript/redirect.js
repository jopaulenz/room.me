// function redirectToPage(url, delay) {
//   setTimeout(function() {
//     window.location.href = url;
//   }, delay);
// }

// document.addEventListener("DOMContentLoaded", function() {

//   var userRole = document.body.getAttribute('data-user-role');

//   if (window.location.pathname === "/") {
//     redirectToPage("/choose_role", 5000);
//   } else if (window.location.pathname === "/tutorial") {
//     if (userRole === "host") {
//       redirectToPage("/flatmates/:id", 5000);
//     } else if (userRole === "flatmate") {
//       redirectToPage("/hosts/:id", 5000);
//     }
//   } else if (window.location.pathname === "/success") {
//     if (userRole === "host") {
//       redirectToPage("flatmates/:id", 5000);
//     } else if (userRole === "flatmate") {
//       redirectToPage("/hosts/:id", 5000);
//     }
//   }
// });

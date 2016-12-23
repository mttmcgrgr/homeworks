  let Router = require("./router.js");


document.addEventListener("DOMContentLoaded", () => {

  let content = document.querySelector(".content");
  let router = new Router(content);
  router.start();

  let navs = Array.from(document.querySelectorAll(".sidebar-nav li"));
  navs.forEach(nav => {
    nav.addEventListener("click", () => {
      let name = nav.innerText.toLowerCase();
      window.location.hash = name;
    });
  });
});

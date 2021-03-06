/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	  let Router = __webpack_require__(1);


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


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {

	  constructor(node) {
	    this.node = node;

	  }




	  start(){

	    this.render();
	    window.AddEventListener("hashchange", () => {
	      this.render();
	    });
	  }


	  activeRoute(){
	    let hash = window.location.hash;
	    return hash.slice(1);
	  }

	  render(){

	    this.node.innerHTML = "";
	    let name = this.activeRoute();
	    let node = document.createElement("P");
	    node.innerHTML = name;
	    this.node.appendChild(node);
	  }


	}

	module.exports = Router;


/***/ }
/******/ ]);
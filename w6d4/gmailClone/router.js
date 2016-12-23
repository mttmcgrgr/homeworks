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

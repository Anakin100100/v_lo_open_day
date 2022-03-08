import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "rodo_checkbox" ]

  click() {
    if( this.rodo_checkboxTarget.checked ){
        document.getElementById('submit_button').disabled = false; 
        console.log("checked");
    } else {
        document.getElementById('submit_button').disabled = true;
        console.log("unchecked");
    }
  }
}


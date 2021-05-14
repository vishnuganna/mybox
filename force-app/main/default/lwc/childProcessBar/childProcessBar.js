import { LightningElement ,api } from 'lwc';

export default class ChildProcessBar extends LightningElement {

    @api progressValue;
    handlechange(event){
        this.progressValue = event.target.value;

        const selectedEvent = new CustomEvent("progressvaluechange", {
            detail: this.progressValue
          });

          this.dispatchEvent(selectedEvent);
    }
}
import { LightningElement , track } from 'lwc';

export default class ParentProcessBar extends LightningElement {

    @track progressValue= 0;
    handleProgressvalueChange(event){
        this.progressValue = event.detail;
        
    }
}
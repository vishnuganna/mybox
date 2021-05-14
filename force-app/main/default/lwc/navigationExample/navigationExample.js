import { LightningElement , api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationExample extends NavigationMixin(LightningElement) {
    @api recordId;
    // Navigate to New Account Page
    navigateToNewAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
        });
    }
    // Navigate to View Account Page
    navigateToViewAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
}
}
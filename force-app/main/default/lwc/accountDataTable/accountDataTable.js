import { LightningElement , api, track, wire} from 'lwc';

import getaccountDataTable from '@salesforce/apex/accountDataTable.getaccountDataTable';

export default class AccountDataTable extends LightningElement {
    @track  columns = [{
        label: 'Account name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    },
    {
        label: 'Type',
        fieldName: 'Type',
        type: 'text',
        sortable: true
    },

    {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
        sortable: true
    },
    {
        label: 'Website',
        fieldName: 'Website',
        type: 'url',
        sortable: true
    },
    {
        label: 'Rating',
        fieldName: 'Rating',
        type: 'test',
        sortable: true
    }
];

@track error;
    @track accList ;
    @wire(getaccountDataTable)
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            this.accList = data;
        } else if (error) {
            this.error = error;
        }
    }

}
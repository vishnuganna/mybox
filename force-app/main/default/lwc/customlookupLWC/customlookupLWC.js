import { LightningElement, track, api } from 'lwc';
import findRecords from '@salesforce/apex/customLookupController.findRecords';
import { NavigationMixin } from 'lightning/navigation';
import AddeNewContactLabel from '@salesforce/label/c.AddeNewContact';
import NewContactLabel from '@salesforce/label/c.NewContact';
import ContactInformationLabel from '@salesforce/label/c.ContactInformation';
import OwnerLabel from '@salesforce/label/c.Owner';
import AddressInformationLabel from '@salesforce/label/c.AddressInformation';
import cancelLabel from '@salesforce/label/c.cancel';
import saveLabel from '@salesforce/label/c.save';
import RemoveSelectedOptionLabel from '@salesforce/label/c.RemoveSelectedOption';
import SelectOptionLabel from '@salesforce/label/c.SelectOption';
export default class CustomLookup extends NavigationMixin(LightningElement) {
    @track records;
    @track error;
    @api recordId;
    @api selectedRecordName;
    @api selectedRecordTitle;
    @api selectedRecordMState;
    @api selectedRecordMCountry;
    @track selectedRecord;
    @api selectedconname = false;
    @api index;
    @api selectedname;
    @api selectedtitle;
    @api selectedState;
    @api selectedCountry;
    @api relationshipfield;
    @api title;
    @api iconname = "standard:contact";
    @api objectName = 'Contact';
    @api searchfield = 'Name';
    @api staticval = "This is Static Value";
    @api newconform = false;
    @api hidenewconbutton = false;
    @api showcustomlookup = false;
    @api conname = "";
    @api conname1;
    @api confname = "";
    @api contactTitle = "Title";
    @api contactId = "";
    @track contactLocation = "Country";
    @track contactStateProvince = " State ";
    label = {
        AddeNewContactLabel,
        NewContactLabel,
        ContactInformationLabel,
        OwnerLabel,
        AddressInformationLabel,
        cancelLabel,
        saveLabel,
        RemoveSelectedOptionLabel,
        SelectOptionLabel
    }
    /*constructor(){
    super();
    this.iconname = "standard:account";
    this.objectName = 'Account';
    this.searchField = 'Name';
    }*/

    navigateToNewContact() {
        this.newconform = true;
        // this.newconform = false; 
    }
    handleSubmit(event) {
        const confields = event.detail.fields;
        console.log('onsubmit event recordEditForm' + event.detail.fields);
        console.log("confields" + JSON.stringify(confields));
        this.conTitle = confields.Title;
        this.conLocation = confields.MailingCountry;
        this.conStateProvince = confields.MailingState;
        if (confields.FirstName == "" || confields.FirstName == null) {
            this.conname = " " + confields.LastName;
        }
        else {
            this.conname = confields.FirstName + " " + confields.LastName;
        }
        console.log('onsubmit event recordEditForm', event.detail.id)
        console.log("con Title" + confields.Title);
        console.log("con Loc" + confields.MailingCountry);
        console.log("con state" + confields.MailingState);
        console.log("con Name " + this.conname);
        console.log("con Name " + confields.FirstName + " " + confields.LastName);
        this.selectedconname = true;
        /*
        const NewRecordEvent = new CustomEvent(
        'newrec',
        {
        detail : { 
        recordId : event.detail.id, 
        selectedtitle : this.conTitle, 
        selectedState : this.conLocation,
        selectedCountry : this.conStateProvince 
        //index : this.index, 
        // relationshipfield : this.relationshipfield
        }
        }
        );
        this.dispatchEvent(NewRecordEvent); 
        */
        //this.records.id =this.confields.Id;
        this.selectedRecord = undefined;
        //this.records = undefined;
        this.hidenewconbutton = true;
    }
    handleSuccess(event) {
        console.log('onsuccess event recordEditForm', event.detail.id);
        //////////
        console.log('onsubmit event recordEditForm', event.detail.id)
        console.log("con Title" + this.conTitle);
        console.log("con Loc" + this.conLocation);
        console.log("con state" + this.conStateProvince);
        console.log("con Name " + this.conname);
        console.log("Record ID " + event.detail.id);
        console.log("con full Name " + this.conname);
        // this.selectedRecordName = this.selectedRecord.Name;
        const NewRecordEvent = new CustomEvent(
            'newrec',
            {
                detail: {
                    recordId: event.detail.id,
                    selectedtitle: this.conTitle,
                    selectedState: this.conLocation,
                    selectedCountry: this.conStateProvince,
                    selectedname: this.conname,
                    //index : this.index, 
                    // relationshipfield : this.relationshipfield
                }
            }
        );
        this.dispatchEvent(NewRecordEvent);
        //////////
        this.newconform = false;
        this.selectedRecord = true;
    }
    handleOnchange(event) {
        //event.preventDefault();
        const searchKey = event.detail.value;
        this.hidenewconbutton = false;
        //this.records = null;
        /* eslint-disable no-console */
        console.log("searchkey" + searchKey);
        //if(searchKey.length > 2){ 
        /* Call the Salesforce Apex class method to find the Records */
        findRecords({
            searchKey: searchKey,
            objectName: this.objectName,
            searchField: this.searchfield
        })
            .then(result => {
                this.records = result;
                for (let i = 0; i < this.records.length; i++) {
                    const rec = this.records[i];
                    this.records[i].Name = rec[this.searchfield];
                }
                // console.log(JSON.stringify(result));
                this.error = undefined;
                //console.log(' records ', this.records);
            })
            .catch(error => {
                this.error = error;
                this.records = undefined;
            });
    }
    //}
    handleSelect(event) {
        this.selectedconname = true;
        const selectedRecordId = event.detail;
        this.hidenewconbutton = true;
        /* eslint-disable no-console*/
        this.selectedRecord = this.records.find(record => record.Id === selectedRecordId);
        this.selectedRecordTitle = this.selectedRecord.Title;
        this.selectedRecordMState = this.selectedRecord.MailingState;
        this.selectedRecordMCountry = this.selectedRecord.MailingCountry;
        this.selectedRecordName = this.selectedRecord.Name;
        this.conname = this.selectedRecord.Name;
        console.log("Selected Record Name " + this.selectedRecord.Name);
        console.log("Selected Record Name " + this.selectedRecordName);
        // console.log("Selected Record Title"+ this.selectedRecord.Title);
        // console.log("Selected Record State"+ this.selectedRecord.Mailingstate);
        // console.log("Selected Country"+ this.selectedRecord.Mailingcountry);
        ////
        /* fire the event with the value of RecordId for the Selected RecordId */
        const selectedRecordEvent = new CustomEvent(
            'selectedrec',
            {
                detail: {
                    recordId: selectedRecordId,
                    selectedtitle: this.selectedRecordTitle,
                    selectedState: this.selectedRecordMState,
                    selectedCountry: this.selectedRecordMCountry,
                    selectedname: this.selectedRecordName,
                    //selectedCountry : this.selectedRecordMState, 
                    index: this.index,
                    relationshipfield: this.relationshipfield
                }
            }
        );
        this.dispatchEvent(selectedRecordEvent);
    }
    handleRemove(event) {
        event.preventDefault();
        this.selectedRecord = undefined;
        //this.conname = undefined; 
        this.selectedconname = false;
        this.records = undefined;
        this.error = undefined;
        /* fire the event with the value of undefined for the Selected RecordId */
        const selectedRecordEvent = new CustomEvent(
            "selectedrec",
            {
                detail: {
                    recordId: undefined,
                    index: this.index,
                    relationshipfield: this.relationshipfield
                }
            }
        );
        this.dispatchEvent(selectedRecordEvent);
    }
    handleReset(event) {
        this.newconform = false;
        this.bShowEditCon = false;

    }
}
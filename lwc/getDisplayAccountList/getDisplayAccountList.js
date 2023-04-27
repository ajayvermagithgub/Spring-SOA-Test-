/**
 * @File Name          : getDisplayAccountList.js
 * @Description        : Build a component for displaying an account list.
 * @Last Created By   : Ajay verma
 * @Last Created On   : 27-04-2023
 * @Last Modify By   : 
 * @Last Modify On  : 
 * Ver       Date            Author      		    Modification
 * 1.0    27/04/2023   Ajay Verma     Initial Version
**/
import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/RecentlyCreatedAccounts.getAllAccounts';

const columns = [   
    { label: 'Name', fieldName: 'Name' },
    {label: 'Industry', fieldName: 'Industry', type: 'text'},
    {label: 'Number Of Contacts', fieldName: 'Number_of_Contacts__c', type: 'number'},       
    {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', typeAttributes: {  
                                                                    day: 'numeric',  
                                                                    month: 'short',  
                                                                    year: 'numeric',  
                                                                    hour: '2-digit',  
                                                                    minute: '2-digit',  
                                                                    second: '2-digit',  
                                                                    hour12: true}},    
    {label: 'Type', fieldName: 'Type', type: 'Text'}
];
export default class GetDisplayAccountList extends LightningElement {

    @track isLoaded = false;
    availableAccounts;
    error;
    columns = columns;

   @wire( getAccounts )  
    wiredAccount( { error, data } ) {
        this.isLoaded = false;
        if (data) {
            this.isLoaded = true;
            this.availableAccounts = data;
            this.error = undefined;
            console.log('@@ AccountList : '+this.availableAccounts);
        } else if(error) {
            this.error = error;
            console.log('@@ error : '+this.error);
            this.availableAccounts = undefined;
        }

    }
}
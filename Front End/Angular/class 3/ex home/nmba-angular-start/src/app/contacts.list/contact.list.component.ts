import { Component } from '@angular/core';
import { ContactsService } from '../shared/contacts.service';
import { Contact, Address } from '../models/contact';
import { Observable } from "rxjs/Observable";

@Component({
  selector: 'trm-contact-list',
  templateUrl: './contact.list.component.html'
})
export class ContactListComponent {

  private contacts: Observable<Array<Contact>>;

  constructor(cs: ContactsService) {
    this.contacts = cs.getContacts();
  }
}

import { Component } from '@angular/core';
import { ContactsService } from '../shared/contacts.service';
import { ActivatedRoute } from '@angular/router'
import { Contact, Address } from '../models/contact';


@Component({
  selector: 'trm-contact-details',
  templateUrl: './contact.details.component.html'
})
export class ContactDetailsComponent {
  contact: Contact;

  constructor(private route: ActivatedRoute) {
    route.data.map(data => data['contact'])
      .subscribe(contact => { this.contact = contact });
  }
}

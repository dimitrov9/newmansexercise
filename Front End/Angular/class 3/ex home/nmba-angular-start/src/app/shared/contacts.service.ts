import { Injectable } from '@angular/core';
import { Contact, Address } from '../models/contact';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/filter';
import { Observable } from "rxjs/Observable";

@Injectable()
export class ContactsService {
  constructor(public http: Http) { }

  getContacts() {
    return this.http.get('http://localhost:4201/api/contacts') // Gets a response with codes, status, and body(JSON)
      .map(response => response.json()) //Returns the body part of the response
      .map(response => response.items); //Returns the items parts of the body
  }

  getContact(id: number) {
    return this.http.get('http://localhost:4201/api/contacts/' + id) // Gets a response with codes, status, and body(JSON)
      .map(response => response.json()) //Returns the body part of the response
      .map(response => response.item); //Returns the item part of the body
  }

  updateContact(contact: Contact): Observable<Contact>{
    return <Observable<Contact>>this.http
      .put('http://localhost:4201/api/contacts/' + contact.id, contact)
      .map(response => {
        console.log(response);
        return <Contact>response.json().item;
      });
  }

}

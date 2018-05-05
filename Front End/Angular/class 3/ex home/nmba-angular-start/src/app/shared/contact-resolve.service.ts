import { Injectable } from '@angular/core';
import { ContactsService } from "./contacts.service";
import { ActivatedRouteSnapshot } from "@angular/router";
import 'rxjs/add/operator/map';

@Injectable()
export class ContactsResolve {
  constructor(private cs: ContactsService) { }

  resolve(route: ActivatedRouteSnapshot) {
    return this.cs.getContact(route.params['id']);
  }
}

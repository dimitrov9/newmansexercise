import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ContactsMaterialModule } from './contacts-material.module';
import { RouterModule } from '@angular/router';
import { HttpModule } from '@angular/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { ContactsAppComponent } from './app.component';

import { ContactsService } from './shared/contacts.service';
import { ContactsResolve } from "./shared/contact-resolve.service";

import { ContactListComponent } from './contacts.list/contact.list.component';
import { ContactDetailsComponent } from './contacts.details/contact.details.component';
import { ContactEditComponent } from './contacts.edit/contact.edit.component';

@NgModule({
  declarations: [
    ContactEditComponent,
    ContactListComponent,
    ContactDetailsComponent,
    ContactsAppComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    ContactsMaterialModule,
    FlexLayoutModule,
    HttpModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule.forRoot([
      { path: "", component: ContactListComponent },
      {
        path: "contact/:id", component: ContactDetailsComponent,
        resolve: { contact: ContactsResolve }
      },
      {
        path: "contact/:id/edit", component: ContactEditComponent,
        resolve: { contact: ContactsResolve }
      },
      { path:'**',redirectTo:'/' }
    ])

  ],
  providers: [ContactsResolve,ContactsService],
  bootstrap: [ContactsAppComponent]
})
export class ContactsModule { }

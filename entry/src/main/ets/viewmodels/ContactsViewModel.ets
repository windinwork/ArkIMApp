import ObservedDataSource from "../datasource/ObservedDataSource";
import { ContactItem, ContactGroup } from "../entry/ContactItem";
import ContactsModel from "../model/ContactsModel";

@Observed
export default class ContactsViewModel {
  contactsDataSource: ObservedDataSource<ContactGroup> = new ObservedDataSource();
  model: ContactsModel = new ContactsModel();

  async fetchContacts() {
    let contacts = await this.model.fetchContacts();
    let contactsDataSource: ObservedDataSource<ContactItem> = new ObservedDataSource();
    contactsDataSource.appendArrayData(contacts);
    let contactGroup = new ContactGroup('企业通讯录', contactsDataSource);
    this.contactsDataSource.addData(contactGroup);
  }

  fetchCustomers() {
    let customers: ObservedDataSource<ContactItem> = new ObservedDataSource()
    customers.addData(new ContactItem('app.media.ic_public_user', '我的客户', ''));
    customers.addData(new ContactItem('app.media.ic_public_user', '添加客户', ''));
    let customGroup = new ContactGroup('我的客户', customers);
    this.contactsDataSource.addData(customGroup)
  }
}
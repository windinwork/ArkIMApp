import { ContactItem } from "../entry/ContactItem";

export default class ContactsModel {
  fetchContacts(): Promise<ContactItem[]> {
    return new Promise(resolve => {
      setTimeout(() => {
        resolve([
          new ContactItem('app.media.ic_public_user', '同事A', ''),
          new ContactItem('app.media.ic_public_user', '同事B', ''),
          new ContactItem('app.media.ic_public_user', '同事C', ''),
          new ContactItem('app.media.ic_public_user', '同事D', ''),
          new ContactItem('app.media.ic_public_user', '同事E', ''),
          new ContactItem('app.media.ic_public_user', '同事F', ''),
          new ContactItem('app.media.ic_public_user', '同事G', ''),
          new ContactItem('app.media.ic_public_user', '同事H', ''),
          new ContactItem('app.media.ic_public_user', '同事I', ''),
          new ContactItem('app.media.ic_public_user', '同事J', ''),
          new ContactItem('app.media.ic_public_user', '同事K', ''),
          new ContactItem('app.media.ic_public_user', '同事L', ''),
          new ContactItem('app.media.ic_public_user', '同事M', ''),
          new ContactItem('app.media.ic_public_user', '同事N', ''),
          new ContactItem('app.media.ic_public_user', '同事O', ''),
          new ContactItem('app.media.ic_public_user', '同事P', ''),
          new ContactItem('app.media.ic_public_user', '同事Q', ''),
          new ContactItem('app.media.ic_public_user', '同事R', ''),
          new ContactItem('app.media.ic_public_user', '同事S', ''),
          new ContactItem('app.media.ic_public_user', '同事T', ''),
          new ContactItem('app.media.ic_public_user', '同事U', ''),
          new ContactItem('app.media.ic_public_user', '同事V', ''),
          new ContactItem('app.media.ic_public_user', '同事W', ''),
          new ContactItem('app.media.ic_public_user', '同事X', ''),
          new ContactItem('app.media.ic_public_user', '同事Y', ''),
          new ContactItem('app.media.ic_public_user', '同事Z', ''),
        ])
      }, 1000)
    });
  }
}
import ObservedDataSource from "../datasource/ObservedDataSource";

export class ContactItem {
  icon: string;
  title: string;
  remark: string;

  constructor(icon: string, title: string, remark: string) {
    this.icon = icon;
    this.title = title;
    this.remark = remark;
  }
}

export class ContactGroup {
  groupName: string;
  items: ObservedDataSource<ContactItem>;

  constructor(groupName: string, items: ObservedDataSource<ContactItem>) {
    this.groupName = groupName;
    this.items = items;
  }
}
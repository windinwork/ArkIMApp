import ContactsViewModel from "../viewmodels/ContactsViewModel"
import Constants from "../constants/Constants";
import { ContactGroup, ContactItem } from "../entry/ContactItem";

@Component
export default struct ContactsView {
  private viewModel: ContactsViewModel = new ContactsViewModel();

  build() {
    Column() {
      List() {
        LazyForEach(this.viewModel.contactsDataSource, (item: ContactGroup, index: number) => {
          ListItemGroup( { header: this.titleView(item.groupName)}) {
            if (item.items) {
              LazyForEach(item.items, (item: ContactItem, index: number) => {
                this.listItem(item, index)
              })
            }
          }
        })
      }.width(Constants.FULL_SCREEN)
      .height(Constants.AUTO)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#E3E3E3')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  titleView(title: string) {
    Text(title)
      .fontColor('#333333').opacity(0.8)
      .fontSize(12)
      .margin({
        left: 16,
        top: 8,
        bottom: 8,
        right: 16
      })
  }

  @Builder
  listItem(item: ContactItem, index: number) {
    ListItem() {
      Row() {
        Image($r(item.icon)).width(40).height(40).fillColor(Constants.COLORS[index % Constants.COLORS.length])
        Text(item.title).fontSize(16).margin({ left: 16 })
      }
      .justifyContent(FlexAlign.Start)
      .padding({
        left: 8,
        top: 4,
        bottom: 4,
        right: 8
      })
      .width(Constants.FULL_SCREEN)
    }.backgroundColor(Color.White)
  }

  aboutToAppear(): void {
    this.viewModel.fetchCustomers();
    this.viewModel.fetchContacts();
  }
}
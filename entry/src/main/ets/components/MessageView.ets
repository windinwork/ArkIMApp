import Constants from "../constants/Constants";
import Message from "../entry/Message";
import MessageViewModel from "../viewmodels/MessageViewModel";

@Component
export default struct MessageView {
  @State messageViewModel: MessageViewModel = new MessageViewModel();

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Row() {
          Image($r("app.media.ic_public_chat")).width(14).height(14)
          Text("全部").margin(4).fontSize(12).opacity(0.8)
        }.justifyContent(FlexAlign.Center)
        .flexGrow(1)

        Row() {
          Image($r("app.media.ic_public_calendar")).width(14).height(14).padding({bottom:2})
          Text("日程").margin(4).fontSize(12).opacity(0.8)
        }.justifyContent(FlexAlign.Center)
        .flexGrow(1)

        Row() {
          Image($r("app.media.ic_public_meeting")).width(16).height(16).padding({bottom:1})
          Text("会议").margin(4).fontSize(12).opacity(0.8)
        }.justifyContent(FlexAlign.Center)
        .flexGrow(1)
      }.backgroundColor('#F8F8F8').height(36)

      // 消息列表内容
      List() {
        LazyForEach(this.messageViewModel.messageList, (item: Message, index: number) => {
          ListItem() {
            Row() {
              Image($r(item.icon)).width(40).height(40).margin({ right: 12 }).fillColor(Constants.COLORS[index % Constants.COLORS.length])
              Column() {
                Text(item.title).fontSize(16)
                Text(item.subtitle).fontSize(12).opacity(0.6).margin({top: 4}).ellipsisMode(EllipsisMode.END)
              }.alignItems(HorizontalAlign.Start).layoutWeight(1)
              Text(item.time).fontSize(10).margin({ left: '8' }).opacity(0.4)
            }.padding(12).alignItems(VerticalAlign.Center)
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear(): void {
    this.messageViewModel.getMessages();
  }
}
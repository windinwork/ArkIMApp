@Component
export default struct DocView {
  build() {
    Column() {
      // 分类筛选行
      Row() {
        Button('与我相关')
          .type(ButtonType.Normal)
          .fontSize(14)
          .fontColor('#888888')
          .layoutWeight(1)
          .backgroundColor($r('sys.color.comp_background_list_card'))

        Divider().vertical(true)

        Button('智能表格')
          .type(ButtonType.Normal)
          .fontSize(14)
          .fontColor('#888888')
          .layoutWeight(1)
          .backgroundColor($r('sys.color.comp_background_list_card'))
      }
      .height(40)

      Divider()

      // 空状态提示
      Column({space: 20}) {
        Image($r('app.media.ic_public_doc'))// 替换成文档图标
          .width(64).height(64)

        Text('当前没有文档')
          .fontSize(16)
          .fontColor('#999999')
          .margin({ bottom: 200 })
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .height('70%')
      .width('100%')
      .height('100%')
    }
  }
}
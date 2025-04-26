import Constants from "../constants/Constants";

interface WorkbenchItem {
  title: string;
  icon: string;
}

@Component
export default struct WorkbenchView {
  build() {
    Scroll() {
      Column() {
        // 顶部栏
        Row() {
          Text('工作台')
            .fontSize(14)
            .fontColor(Color.White)
          Text(' ·IT服务')
            .fontSize(14)
            .opacity(0.6)
            .fontColor(Color.White)
        }
        .alignSelf(ItemAlign.Start)
        .padding({ left: 16, right: 16 })
        .width(Constants.FULL_SCREEN)
        .height(50)
        .backgroundColor(Constants.COLOR_MAIN_THEME)

        // 操作按钮区
        Row({ space: 10 }) {
          this.topButton('了解价值', 'app.media.ic_public_workbench')
          this.topButton('操作手册', 'app.media.ic_public_workbench')
        }
        .padding({
          bottom: 12,
          left: 16,
          right: 16
        })
        .backgroundColor(Constants.COLOR_MAIN_THEME)

        Column() {
          // 宣传Banner
          Image($r('app.media.ic_public_banner'))
            .width('100%')
            .height(125)
            .padding({ left: 8, right: 8 })
            .margin({ top: 8 })
            .objectFit(ImageFit.Cover)
            .borderRadius(8)

          // 客户联系与管理
          this.featureSection('客户联系与管理', [
            { title: '客户联系', icon: 'app.media.ic_public_workbench' },
            { title: '客户群', icon: 'app.media.ic_public_workbench' },
            { title: '客户朋友圈', icon: 'app.media.ic_public_workbench' },
            { title: '客服', icon: 'app.media.ic_public_workbench' },
            { title: '获客助手', icon: 'app.media.ic_public_workbench' },
            { title: '离职继承', icon: 'app.media.ic_public_workbench' },
            { title: '群发助手', icon: 'app.media.ic_public_workbench' },
            { title: '对外收款', icon: 'app.media.ic_public_workbench' },
            { title: '学习园地', icon: 'app.media.ic_public_workbench' },
          ])

          // 上下游管理
          this.featureSection('上下游管理', [
            { title: '上下游', icon: 'app.media.ic_public_workbench' },
            { title: '上下游群', icon: 'app.media.ic_public_workbench' },
            { title: '上下游协作', icon: 'app.media.ic_public_workbench' },
          ])

          Stack()
            .height(10)
        }
      }
      .backgroundColor('#E3E3E3')
      .justifyContent(FlexAlign.Start)
      .height(Constants.FULL_SCREEN)
    }.scrollable(ScrollDirection.Vertical)
  }

  @Builder
  topButton(label: string, icon: string) {
    Column({ space: 4 }) {
      Image($r(icon)).width(24).height(24)
      Text(label).fontSize(12).fontColor(Color.White)
    }
    .padding(8)
    .backgroundColor('#E6F0FF')
    .opacity(0.6)
    .borderRadius(8)
    .width('50%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  featureSection(title: string, items: WorkbenchItem[]) {
    Column() {
      Text(title)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)
        .opacity(0.6)
        .margin({ top: 16, left: 16 })

      Grid() {
        ForEach(items, (item: WorkbenchItem) => {
          GridItem() {
            Column({ space: 4 }) {
              Image($r(item.icon)).width(36).height(36)
              Text(item.title).fontSize(12).maxLines(1)
            }
            .alignItems(HorizontalAlign.Center)
            .width(60)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .maxCount((items.length + 3) / 4)
      .margin(16)
    }
    .margin({ top: 8, left: 8, right: 8 })
    .backgroundColor(Color.White)
    .borderRadius(4)
  }
}

import ContactsView from '../components/ContactsView';
import DocView from '../components/DocView';
import MailView from '../components/MailView';
import MessageView from '../components/MessageView';
import WorkbenchView from '../components/WorkbenchView';
import Constants from '../constants/Constants';
import Logger from '../utils/Logger'
import { common } from '@kit.AbilityKit';
import { WindowUtil } from '../utils/WindowUtil';

@Entry
@Component
export struct IndexPage {
  @State currentIndex: number = 0
  private tabsTitle: string[] = ['消息', '邮件', '文档', '工作台', '通讯录']
  @State title: string = this.tabsTitle[0];
  private selectedTabsIcon = [
    $r("app.media.ic_public_chat"),
    $r("app.media.ic_public_mail"),
    $r("app.media.ic_public_doc"),
    $r("app.media.ic_public_workbench"),
    $r("app.media.ic_public_organization")
  ]
  private tabsIcon = [
    $r("app.media.ic_public_chat"),
    $r("app.media.ic_public_mail"),
    $r("app.media.ic_public_doc"),
    $r("app.media.ic_public_workbench"),
    $r("app.media.ic_public_organization")
  ]

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Stack({alignContent: Alignment.Start}) {
        Image($r("app.media.ic_public_menu"))
          .width(24)
          .height(24)
          .fillColor(Color.White)
          .margin({left:8})
        Row() {
          Image($r("app.media.ic_public_search"))
            .width(24)
            .height(24)
            .fillColor(Color.White)
            .margin({ top: 1, right: 16 })
          Image($r("app.media.ic_public_plus"))
            .width(24)
            .height(24)
            .fillColor(Color.White)
            .margin({right:8})
        }.justifyContent(FlexAlign.End).margin({ right: 16 }).width(Constants.FULL_SCREEN)
        Text(this.title).fontSize(18).fontColor(Color.White).textAlign(TextAlign.Center).align(Alignment.Center).width(Constants.FULL_SCREEN)
      }.width(Constants.FULL_SCREEN)
      .height(56)
      .backgroundColor(Constants.COLOR_MAIN_THEME)

      // 内容区域
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          MessageView()
        }.tabBar({
          icon: this.getTabIcon(0),
          text: this.tabsTitle[0]
        })

        TabContent() {
          MailView()
        }.tabBar({
          icon: this.getTabIcon(1),
          text: this.tabsTitle[1]
        })

        TabContent() {
          DocView()
        }.tabBar({
          icon: this.getTabIcon(2),
          text: this.tabsTitle[2]
        })

        TabContent() {
          WorkbenchView()
        }.tabBar({
          icon: this.getTabIcon(3),
          text: this.tabsTitle[3]
        })

        TabContent() {
          ContactsView()
        }.tabBar({
          icon: this.getTabIcon(4),
          text: this.tabsTitle[4]
        })
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .onChange((index: number) => {
        Logger.info(`Tab changed from ${this.currentIndex} to ${index}`)
        this.currentIndex = index
        this.title = this.tabsTitle[index];
      })
    }
  }

  // 获取带状态的Tab图标
  private getTabIcon(index: number): Resource {
    return this.currentIndex === index ?
    this.selectedTabsIcon[index] :
    this.tabsIcon[index] // 实际应使用选中/未选中两种状态图标
  }

  // 添加生命周期日志
  aboutToAppear() {
    Logger.info('Index page about to appear')

    let context = getContext(this) as common.UIAbilityContext;
    let windowStage = context.windowStage;
    WindowUtil.restoreFullScreen(windowStage, context);
    WindowUtil.updateStatusBarColor(context, Constants.COLOR_MAIN_THEME, true)
  }

  aboutToDisappear() {
    Logger.info('Index page about to disappear')
  }
}
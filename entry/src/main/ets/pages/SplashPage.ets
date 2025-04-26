import { router } from '@kit.ArkUI'
import Constants from '../constants/Constants'
import Logger from '../utils/Logger'
import { WindowUtil } from '../utils/WindowUtil'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct SplashPage {
  private timerId: number = -1

  aboutToAppear() {
    Logger.debug('开屏页显示')

    let context = getContext(this) as common.UIAbilityContext;
    let windowStage = context.windowStage;
    WindowUtil.requestFullScreen(windowStage, context);
    // 设置3秒后自动跳转
    this.timerId = setTimeout(() => {
      Logger.info('跳转至主页面')
      router.replaceUrl({
        url: "pages/IndexPage"
      }).catch((err: Error) => {
        Logger.error('页面跳转失败:', err)
      })
    }, 3000)
    Logger.info('启动3秒跳转定时器，ID:', this.timerId)
  }

  aboutToDisappear() {
    Logger.debug('开屏页即将消失')
    // 清除定时器
    if (this.timerId !== -1) {
      clearTimeout(this.timerId)
      Logger.info('清除跳转定时器，ID:', this.timerId)
    } else {
      Logger.warn('尝试清除不存在的定时器')
    }
  }

  build() {
    Column() {
      // 开屏图片
      Image($r("app.media.ic_public_splash"))
        .width(Constants.FULL_SCREEN)
        .height(Constants.FULL_SCREEN)
        .onClick(() => {
          Logger.info('用户点击了开屏logo')
        })

      // 加载进度条
      Progress({ value: 100, style: ProgressStyle.Linear })
        .width("80%")
        .height(8)
        .color("#87CEEB")
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#FFFFFF")
    .onAppear(() => {
      Logger.debug('开屏页布局渲染完成')
    })
  }
}

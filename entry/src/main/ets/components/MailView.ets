import Constants from "../constants/Constants"

@Component
export default struct MailView {
  @State email: string = ''
  @State password: string = ''

  build() {
    Scroll( ) {
      Column({ space: 20 }) {
        // 信封图标
        Image($r('app.media.ic_public_mail'))// 换成你项目的资源
          .width(48).height(48)
          .margin({ top: 80 })

        // 提示语
        Text('添加你的工作邮箱\n让工作消息集于一处').fontSize(20).fontWeight(FontWeight.Bold)

        // 邮箱输入框
        TextInput({
          placeholder: 'email@company.com',
          text: this.email,
        })
          .onChange((value: string) => {
            this.email = value
          })
          .type(InputType.Email)
          .width('80%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .padding({ left: 12 })

        // 密码输入框
        TextInput({
          placeholder: '邮箱密码',
          text: this.password,
        })
          .onChange((value: string) => {
            this.password = value
          })
          .type(InputType.Password)
          .width('80%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .padding({ left: 12 })

        // 添加按钮
        Button('添加')
          .width('80%')
          .height(42)
          .backgroundColor('#A9D2FF')
          .borderRadius(10)
          .fontSize(16)
          .fontColor(Color.White)
          .onClick(() => {
            console.log(`邮箱: ${this.email}, 密码: ${this.password}`)
            // 调用添加邮箱逻辑
          })
      }
      .alignItems(HorizontalAlign.Start)
    }
    .width(Constants.FULL_SCREEN)
    .height(Constants.FULL_SCREEN)
    .align(Alignment.Top)
  }
}
import Message from "../entry/Message";

export default class MessageModel {
  async getMessages(): Promise<Message[]> {
    return new Promise(resolve => {
      setTimeout(() => {
        resolve([
          new Message('app.media.ic_public_user_card', '公司大群', 'Ray: 大家好！我是Ray，我来了。', '上午8:22'),
          new Message('app.media.ic_public_user_card', '企业XX团队', '欢迎来到企业XX', '上午8:22'),
          new Message('app.media.ic_public_user_card', '打卡', '下班打卡提醒', '4/11'),
        ]);
      }, 1000);
    })
  }

}
import ObservedDataSource from '../datasource/ObservedDataSource';
import Message from '../entry/Message';
import MessageModel from '../model/MessageModel';

export default class MessageViewModel {
  messageList: ObservedDataSource<Message> = new ObservedDataSource();
  messageModel: MessageModel = new MessageModel();

  async getMessages() {
    let messages = await this.messageModel.getMessages();
    this.messageList.appendArrayData(messages);
  }
}
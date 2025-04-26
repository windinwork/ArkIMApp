export default class Message {
  public icon: string           ; // 图标资源
  public title: string;  // 标题
  public subtitle: string; // 副标题
  public time: string;   // 时间

  constructor(icon: string, title: string, subtitle: string, time: string) {
    this.icon = icon;
    this.title = title;
    this.subtitle = subtitle;
    this.time = time;
  }
}
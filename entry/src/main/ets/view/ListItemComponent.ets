@Component
export default struct ListItemComponent {

  private index:number;
  private name:Resource;
  private vote:string;
  private refreshDataSource:boolean;

  // 状态驱动ui
  @State isChange:boolean = false;

  // ui
  build() {
    Row() {
      Text(this.index + "")
        .fontSize(FontStyle.Normal);
      Text(this.name)
        .fontSize(FontStyle.Normal)
        .margin({right: 20})
      Text(this.vote)
        .fontSize(FontStyle.Normal);
    }
    .height(20)
    .width(200)
    .onClick(()=> this.isChange = !this.isChange)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  // 渲染排名样式
  isRenderCircleText() : boolean {
    return this.index === 1 || this.index === 2 || this.index === 3;
  }
}
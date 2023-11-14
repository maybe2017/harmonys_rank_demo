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
      Text(this.name)
        .width(500)
        .fontSize(FontStyle.Normal);
      Text(this.vote)
        .width(500)
        .fontSize(FontStyle.Normal);
    }
    .height(20)
    .width(600)
    .onClick(()=> this.isChange = !this.isChange);
  }

  // 渲染排名样式
  isRenderCircleText() : boolean {
    return this.index === 1 || this.index === 2 || this.index === 3;
  }
}
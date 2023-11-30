import { CommonUntil } from '../../viewmodel/workTarget/SubTargetItemData';

@Component
export default struct WorkTargetComponent {
  completedCount: number = 0;
  totalCount: number = 0;
  lastUpdateTimeStr: string = ""

  // ui
  build() {
    Column() {
      Text("工作目标")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10, left: 12 })
      Column() {
        Row() {
          Image($r('app.media.icon'))
            .height(80)
            .width(80)
          Column({ space: 7 }) {
            Text("第一季度运营目标")
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              // .alignSelf(ItemAlign.Start)
            Text("实现用户量与用户活跃度提升。")
              .fontSize(15)
              .fontColor(Color.Gray)
              .fontWeight(FontWeight.Medium)
              .opacity(0.5)
          }
          .margin({left: 10})
          // 控制列组件里面 所有子组件不要默认的水平居中，从左到右依次排列
          .alignItems(HorizontalAlign.Start)
        }
        // 这里不设置的话 列中的子组件均默认是水平居中
        .alignSelf(ItemAlign.Start)

        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Column({ space: 5 }) {
            Text("整体进度")
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
            Text("更新时间: " + CommonUntil.parse2ShowTimeStr(new Date(this.lastUpdateTimeStr)))
              .fontSize(15)
              .fontColor(Color.Gray)
              .fontWeight(FontWeight.Medium)
              .opacity(0.5)
          }.alignItems(HorizontalAlign.Start)

          Stack() {
            Progress({value:this.completedCount, total:this.totalCount, type:ProgressType.Ring})
              .width(50)
              .color(Color.Blue)
            Text(this.completedCount.toString()).fontColor(Color.Red).offset({ x: -8 }).fontWeight(FontWeight.Medium)
            Text("/" + this.totalCount).offset({ x: 6 }).fontWeight(FontWeight.Medium)
          }.alignSelf(ItemAlign.Center)
        }
        .margin({ top: 10})
      }
      .backgroundColor(Color.White)
      .borderRadius(20)
      .padding(10)
    }
    .alignItems(HorizontalAlign.Start)
  }
}
import AppContext from '@ohos.app.ability.common';

@Component
@Entry
export default struct WorkTargetComponent {
  completedCount: number = 0;
  totalCount: number = 0;
  updateTime: Date = new Date("2023-11-27 16:30:30")

  // ui
  build() {
    Column() {
      Column({ space: 20 }) {
        Text("工作目标")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10, left: 12 })
        Flex({ direction: FlexDirection.Column }) {
          Row() {
            Image($r('app.media.icon'))
              .height(80)
              .width(80)
              .margin(10)
            Column({ space: 7 }) {
              Text("第一季度运营目标")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
              Text("实现用户量与用户活跃度提升。")
                .fontSize(15)
                .fontColor(Color.Gray)
                .fontWeight(FontWeight.Medium)
                .opacity(0.5)
            }.alignItems(HorizontalAlign.Start)
          }

          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            Column({ space: 5 }) {
              Text("整体进度")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
              Text("更新时间: " + this.getUpdateTimeStr(this.updateTime))
                .fontSize(15)
                .fontColor(Color.Gray)
                .fontWeight(FontWeight.Medium)
                .opacity(0.5)
            }.alignItems(HorizontalAlign.Start)


            Stack() {
              Image($r('app.media.loading')).width(40)
              Text(this.completedCount.toString()).fontColor(Color.Red).offset({ x: -8 }).fontWeight(FontWeight.Medium)
              Text("/" + this.totalCount).offset({ x: 6 }).fontWeight(FontWeight.Medium)
            }.alignSelf(ItemAlign.Center)
          }
          .margin(10)
        }
        .alignSelf(ItemAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(20)
      }
      .width('90%')
      .height('22%')
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(HorizontalAlign.Start)
    }.width('100%')
    .height('100%')
    .backgroundColor("#eee")
  }

  getUpdateTimeStr(updateTime: Date): string {
    return "" + updateTime.getFullYear()
    + "/" + (updateTime.getMonth() + 1)
    + "/" + updateTime.getDate() + " " + updateTime.getHours()
    + ":" + updateTime.getMinutes()
    + ":" + updateTime.getSeconds();
  }
}
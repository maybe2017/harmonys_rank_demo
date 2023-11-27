@Component
@Entry
export default struct SubTargetComp {
  isEditStatus: boolean = false;
  isChooseAll: boolean = false;

  // ui
  build() {
    Column() {
      Row() {
        Text("子目标")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10, left: 12 })

        Row() {
          if (this.isEditStatus) {
            Text("编辑")
              .editAndCancelStyle()
          } else {
            Text("取消")
              .editAndCancelStyle()
              .margin({right:15})
            Text("全选")
              .editAndCancelStyle()
            Checkbox().onChange((choose)=>{
              this.isChooseAll = choose;
            })
          }
        }
      }
      .width('90%')
      .height('22%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    .height('100%')
    .backgroundColor("#eee")
  }
}


// 编辑 全选 取消公用样式
@Extend(Text) function editAndCancelStyle() {
  .fontSize(16)
  .fontColor(Color.Blue)
  .fontWeight(FontWeight.Bold)
}
import {SubTargetItemData} from '../../viewmodel/workTarget/SubTargetItemData';
@Component
@Entry
export default struct SubTargetItemComp {
  isEditStatus: boolean = false;
  isChooseAll: boolean = false;

  // 当前点击索引
  currentClickIndex: number = -1;
  currentData: SubTargetItemData;

  // ui
  build() {
    Column() {
      Column() {
        Row() {
          Text(this.currentData.subTitle)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Text(this.currentData.progress)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row(){
          Text("更新时间: " + this.getUpdateTimeStr(this.currentData.updateTime))
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Gray)
            .opacity(0.5)
        }
        .alignSelf(ItemAlign.End)
        .margin({top:10})

        Column(){
          Blank()
          Progress({ value: 33, total: 100, type: ProgressType.Capsule })
            .color(Color.Blue)
            .value(33)
            .width(280)
            .height(20)
            .margin({top:20, bottom:10})

          Row(){
            Text("取消").editAndCancelStyle()
            Text("确定").editAndCancelStyle()
          }
          .width("100%")
          .justifyContent(FlexAlign.SpaceAround)
        }

        // if (this.currentClickIndex.toString() === this.currentData.subId) {
        //   Progress({ value: 20, total: 150, type: ProgressType.Linear }).color(Color.Grey).value(50).width(200)
        // }
      }
      .width('90%')
      .backgroundColor(Color.White)
      .borderRadius(20)
      .padding(10)
      .onClick(()=> {

      })
    }
    .width('100%')
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


// 编辑 全选 取消公用样式
@Extend(Text) function editAndCancelStyle() {
  .fontSize(16)
  .fontColor(Color.Blue)
  .fontWeight(FontWeight.Bold)
}


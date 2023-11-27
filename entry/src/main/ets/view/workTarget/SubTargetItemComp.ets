import { SubTargetItemData } from '../../viewmodel/workTarget/SubTargetItemData';

@Component
export default struct SubTargetItemComp {
  // 是否是编辑状态
  isEditStatus: boolean = false;
  // 是否是选中状态
  @State isChooseStatus: boolean = false;


  // 本身的索引
  selfIndex: number;
  // 当前点击索引
  @Link currentClickIndex: number;


  // 数据对象
  currentDataJson: string;
  currentData: SubTargetItemData;

  aboutToAppear() {
    this.currentData = JSON.parse(this.currentDataJson);
    console.log("===>> SubTargetItemComp ===> " + JSON.stringify(this.currentData))

    console.log("===>> 打印对象属性值 ===> " + this.currentData.updateTime)
    console.log("===>> 正常时间对象 ===> " + new Date("2023-11-27 16:30:30"))
    console.log("===>> 正常时间对象解析为字符串 ===> " + this.getUpdateTimeStr(new Date("2023-11-27 16:30:30")))
    console.log("===>> 先转json，再从json反序列化后的时间对象，解析字符串异常 ===> " + this.getUpdateTimeStr(this.currentData.updateTime))
    if (this.currentData === null || this.currentData === undefined) {
      console.log("接受到的currentDataJson为空！设置默认测试数据...")
      this.currentData = new SubTargetItemData("0", "目标一", "33%", new Date("2023-11-26 15:20:03"));
    }
  }


  // ui
  build() {
    Row(){
      Column() {
        Row() {
          Text(`${this.currentData.subTitle}`)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Text(`${this.currentData.progress}`)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        // TODO
        // .flexGrow(1)
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Text("更新时间: " + this.getUpdateTimeStr(new Date()))
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Gray)
            .opacity(0.5)
        }
        .alignSelf(ItemAlign.End)
        .margin({ top: 10 })

        if (this.selfIndex === this.currentClickIndex) {
          Column() {
            Blank()
            Progress({ value: 33, total: 100, type: ProgressType.Capsule })
              .color(Color.Blue)
              .value(Number.parseInt(`${this.currentData.progress}`))
              .width(280)
              .height(20)
              .margin({ top: 20, bottom: 10 })

            Row() {
              Text("取消").editAndCancelStyle().onClick(()=>{this.currentClickIndex=-1})
              Text("确定").editAndCancelStyle().onClick(()=>{this.currentClickIndex=-1})
            }
            .width("100%")
            .justifyContent(FlexAlign.SpaceAround)
            // TODO 不生效？
            .animation({duration:2000})
          }
        }
      }

      // TODO &&
      if (this.currentClickIndex === -1) {
        Row(){
          Checkbox().onChange((choose) => {
            this.isChooseStatus = choose;
          })
        }
        .alignSelf(ItemAlign.End)
        .margin({ left: -10 })
      }
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(20)
    .padding(10)
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


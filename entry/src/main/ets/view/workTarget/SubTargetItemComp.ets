import { SubTargetItemData } from '../../viewmodel/workTarget/SubTargetItemData';
import { CHOOSE_ALL_GROUP_KEY } from '../../common/ConstantsForWorkTarget'

@Component
export default struct SubTargetItemComp {

  // 子项本身的索引
  selfIndex: number;

  // 是否是全局编辑状态
  @Link isEditStatus: boolean;

  // 当前展开状态子项索引(只能有一个)
  @Link currentSubItemExpandIndex: number;

  // 数据对象
  currentDataJson: string;
  @State currentData: SubTargetItemData = new SubTargetItemData("0", "初始化子项", 0, "2023-11-26 00:20:03");

  aboutToAppear() {
    this.currentData = JSON.parse(this.currentDataJson);
    console.log("===>> SubTargetItemComp ===> " + JSON.stringify(this.currentData))
    if (this.currentData === null || this.currentData === undefined) {
      console.log("接受到的currentDataJson为空！设置默认测试数据...")
      this.currentData = new SubTargetItemData("0", "初始化子项", 0, "2023-11-26 00:20:03");
    }
  }


  // ui
  build() {
    Row() {
      Column() {
        Row() {
          Text(`${this.currentData.subTitle}`)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Text(`${this.currentData.progress}%`)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Text("更新时间: " + this.getUpdateTimeStr(new Date(this.currentData.updateTimeStr)))
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Gray)
            .opacity(0.5)
        }
        .alignSelf(ItemAlign.End)
        .margin({ top: 10 })

        // 子项索引与点击索引相等时，子项展开
        if (this.selfIndex === this.currentSubItemExpandIndex) {
          Column() {
            Blank()
            Slider({ value: Number.parseInt(`${this.currentData.progress}`) })
              .showTips(true)
              .blockColor(Color.Blue)
              .selectedColor(Color.Blue)
              .trackColor(Color.Gray)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.currentData.progress = Number.parseInt(value.toFixed(0))
              })

            Row() {
              Text("取消").editAndCancelStyle().onClick(() => {
                animateTo({duration:500}, ()=>{
                  this.currentSubItemExpandIndex = -1
                })
              })
              Text("确定").editAndCancelStyle().onClick(() => {
                animateTo({duration:500}, ()=>{
                  this.currentSubItemExpandIndex = -1
                })
              })
            }
            .width("100%")
            .justifyContent(FlexAlign.SpaceAround)
          }
          .transition({ type: TransitionType.Insert, translate: { x: -40, y: 0 }, opacity: 0 })
          .transition({ type: TransitionType.Delete, translate: { x: 40, y: 0 }, opacity: 0 })
        }
      }
      .layoutWeight(1)

      if (this.currentSubItemExpandIndex === -1 && this.isEditStatus) {
        Row() {
          Checkbox({ group: CHOOSE_ALL_GROUP_KEY })
        }
        .alignSelf(ItemAlign.End)
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


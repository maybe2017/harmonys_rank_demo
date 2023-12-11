import WorkTargetDataModel, { CommonUntil, SubTargetItemData} from '../../viewmodel/workTarget/SubTargetItemData';
import { CHOOSE_ALL_GROUP_KEY } from '../../common/ConstantsForWorkTarget'

@Component
export default struct SubTargetItemComp {

  // 子项本身的索引
  selfIndex: number;
  // 当前被展开项的进度拖动值
  currentExpandItemSliderProcess: number;

  // 是否是全局编辑状态
  @Link isEditStatus: boolean;
  // 当前展开状态子项索引(只能有一个)
  @Link currentSubItemExpandIndex: number;
  // 强制顶层组件刷新(子目标项达到100% -> 通知顶层组件重新计算整体进度)
  @Consume refreshOverallProgress: boolean;

  // 数据对象(此处用json接收，也可以直接采用传对象方式)
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
          Text("更新时间: " + CommonUntil.parse2ShowTimeStr(new Date(this.currentData.updateTimeStr)))
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
                if (this.currentData.progress != Number.parseInt(value.toFixed(0))) {
                  this.currentExpandItemSliderProcess = Number.parseInt(value.toFixed(0));
                }
              })

            Row() {
              Text("取消").editAndCancelStyle().onClick(() => {
                animateTo({ duration: 500 }, () => {
                  this.currentSubItemExpandIndex = -1
                  this.currentExpandItemSliderProcess = undefined;
                })
              })
              Text("确定").editAndCancelStyle().onClick(() => {
                animateTo({ duration: 500 }, () => {
                  if (this.currentExpandItemSliderProcess || this.currentExpandItemSliderProcess === 0) {

                    let beforeProgress = this.currentData.progress;

                    this.currentData.progress = this.currentExpandItemSliderProcess
                    this.currentData.updateTimeStr = CommonUntil.parse2ShowTimeStr(new Date())
                    WorkTargetDataModel.updateItemByIndex(this.selfIndex, this.currentData)

                    // TODO 奇怪，状态变量的改变 要放在数据的变化之后，不然没效果？？
                    // 原来是100 现在小于100
                    if (beforeProgress === 100 && this.currentExpandItemSliderProcess < 100) {
                      this.refreshOverallProgress = !this.refreshOverallProgress;
                    }
                    // 原来不是100 现在变为100
                    if (this.currentExpandItemSliderProcess === 100) {
                      this.refreshOverallProgress = !this.refreshOverallProgress;
                    }
                  }
                  this.currentSubItemExpandIndex = -1
                  this.currentExpandItemSliderProcess = undefined;
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
          Checkbox({ name: this.currentData.subId, group: CHOOSE_ALL_GROUP_KEY })
        }
        .alignSelf(ItemAlign.End)
      }
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(20)
    .padding(10)
  }
}


// 编辑 全选 取消公用样式
@Extend(Text) function editAndCancelStyle() {
  .fontSize(16)
  .fontColor(Color.Blue)
  .fontWeight(FontWeight.Bold)
}


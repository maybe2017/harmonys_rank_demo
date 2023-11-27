import { SubTargetItemData } from '../../viewmodel/workTarget/SubTargetItemData';
import SubTargetItemComp from './SubTargetItemComp';

@Component
export default struct SubTargetComp {
  @State isEditStatus: boolean = false;
  @State isChooseAll: boolean = false;

  @State currentClickIndex: number = -1;
  @Prop testDataArrJson: string;
  testDataArr: Array<SubTargetItemData>;

  aboutToAppear() {
    this.testDataArr = JSON.parse(this.testDataArrJson)
    console.log("===>>> " + this.testDataArrJson)
    console.log("===>>> " + this.testDataArr.length)
  }

  // ui
  build() {
    Column() {
      // 子目标
      Row() {
        Text("子目标")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10, left: 12 })

        Row() {
          if (!this.isEditStatus) {
            Text("编辑")
              .editAndCancelStyle()
              .margin({ right: 15 })
              .onClick(()=>{
                this.isEditStatus = true
              })
          } else {
            Text("取消")
              .editAndCancelStyle()
              .margin({ right: 15 })
              .onClick(()=>{
                this.isEditStatus = false
              })

            Text("全选")
              .editAndCancelStyle()
            Checkbox().onChange((choose) => {
              this.isChooseAll = choose;
            })
          }
        }
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      // 列表
      Row() {
        Column() {
          List() {
            ForEach(this.testDataArr, (itemData, index) => {
              ListItem() {
                SubTargetItemComp({currentDataJson: JSON.stringify(itemData), selfIndex:index, currentClickIndex:$currentClickIndex});
              }.onClick(() => {
                this.currentClickIndex = index
              })
            }, (itemData, index) => {
              return index.toString()
            })
          }
          .width('100%')
          .height('100%')
          .divider({ strokeWidth: 10 })
          .scrollBar(BarState.Auto)
        }
      }
    }
    // .backgroundColor(Color.Green)
    .width('90%')
    .margin({top: 40}) // TODO ??? 为啥
    .justifyContent(FlexAlign.Center)
  }
}


// 编辑 全选 取消公用样式
@Extend(Text) function editAndCancelStyle() {
  .fontSize(16)
  .fontColor(Color.Blue)
  .fontWeight(FontWeight.Bold)
}
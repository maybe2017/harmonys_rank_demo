import { SubTargetItemData } from '../../viewmodel/workTarget/SubTargetItemData';
import SubTargetItemComp from './SubTargetItemComp';
import { CHOOSE_ALL_GROUP_KEY } from '../../common/ConstantsForWorkTarget'

@Component
export default struct SubTargetComp {

  // 是否是全员编辑状态
  @State isEditStatus: boolean = false;
  // 当前单项展开项索引
  @State currentSubItemExpandIndex: number = -1;
  // 是否是展开状态
  @State isSubItemExpandStatus: boolean = false;

  // 存放全选模式下选择的keys
  checkboxGroupKeyArray:Array<string> = [];

  @Prop testDataArrJson: string;
  testDataArr: Array<SubTargetItemData>;

  aboutToAppear() {
    this.testDataArr = JSON.parse(this.testDataArrJson)
    // console.log("===>>> " + this.testDataArrJson)
    // console.log("===>>> " + this.testDataArr.length)
    console.log("===>>>SubTargetComp  build 之前执行aboutToAppear")
  }

  // ui
  build() {
    Column() {
      // 子目标
      Row() {
        Text("子目标")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        // TODO 为啥点编辑后 高度会多一丢丢出来？
        Row() {
          if (!this.isEditStatus) {
            Text("编辑")
              .editAndCancelStyle()
              .transition({type: TransitionType.Insert, translate: { x: -20, y: 0}, opacity:0})
              .onClick(()=>{
                // 指定动画参数
                animateTo({duration:500}, ()=>{
                  this.isEditStatus = true
                })
              })
          } else {
            Row(){
              Text("取消")
                .editAndCancelStyle()
                .margin({ right: 15 })
                .onClick(()=>{
                  // 指定动画参数
                  animateTo({duration:500}, ()=>{
                    this.isEditStatus = false
                  })
                })

              Text("全选")
                .editAndCancelStyle()
              CheckboxGroup({group:CHOOSE_ALL_GROUP_KEY}).onChange((checkboxGroupResult) => {
                this.checkboxGroupKeyArray = checkboxGroupResult.name;
                console.log("本次全选的选择状态: {}", checkboxGroupResult.status)
              })
            }
            .transition({type: TransitionType.Insert, translate: { x: 20, y: 0}, opacity:0})
            // .transition({type: TransitionType.Delete, scale: { x: 5, y: 5}, opacity:1})
            // TODO 样式加在这里为啥效果不一样？
          }
        }
        // 指定动画的样式
        // .transition({type: TransitionType.All, scale: { x: 500, y: 500 }, opacity:1})
        .margin({right:10})
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left:8})
      .margin({ top: 15, bottom: 15})

      // 列表
      Row() {
        Column() {
          List() {
            ForEach(this.testDataArr, (itemData, index) => {
              ListItem() {
                SubTargetItemComp(
                  { currentDataJson: JSON.stringify(itemData),
                    selfIndex:index,
                    currentSubItemExpandIndex:$currentSubItemExpandIndex,
                    isEditStatus:$isEditStatus
                  },
                );
              }.onClick(() => {
                // 指定动画参数
                animateTo({duration:500}, ()=>{
                  // 如果当前是展开状态 且点击的就是展开项；把展开状态置为false
                  if (this.isSubItemExpandStatus && this.currentSubItemExpandIndex === index) {
                    this.isSubItemExpandStatus = false;
                    this.currentSubItemExpandIndex = -1;
                  } else {
                    this.isSubItemExpandStatus = true;
                    this.currentSubItemExpandIndex = index;
                  }
                })
              })
            }, (itemData, index) => {
              return index.toString()
            })
          }
          .width('100%')
          .height('100%')
          .divider({ strokeWidth: 10 })
        }
      }
      .layoutWeight(1)

      // 删除按钮
      // todo
      Row(){
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r('app.media.ic_public_delete')).width(30).objectFit(ImageFit.Cover)
          }
          .alignItems(VerticalAlign.Center)
        }
        .borderRadius(8).backgroundColor('#f46c6c').width(90).height(30)
      }
    }
    .layoutWeight(1)
    .width('100%')
  }
}


// 编辑 全选 取消公用样式
@Extend(Text) function editAndCancelStyle() {
  .fontSize(16)
  .fontColor(Color.Blue)
  .fontWeight(FontWeight.Bold)
}
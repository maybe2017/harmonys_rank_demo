import { CommonUntil, SubTargetItemData } from '../../viewmodel/workTarget/SubTargetItemData';
import SubTargetItemComp from './SubTargetItemComp';
import { CHOOSE_ALL_GROUP_KEY } from '../../common/ConstantsForWorkTarget'
import promptAction from '@ohos.promptAction'

@Component
export default struct SubTargetComp {

  // 是否是全员编辑状态
  @State isEditStatus: boolean = false;
  // 当前单项展开项索引
  @State currentSubItemExpandIndex: number = -1;
  // 是否是展开状态
  @State isSubItemExpandStatus: boolean = false;
  // 列表数据集合(本组件内只读)
  @Link workTargetDataList: Array<SubTargetItemData>;

  // 存放全选模式下选择的keys
  checkboxGroupKeyArray:Array<string> = [];

  // 增加目标子项的弹窗
  @State newItemInputValue:string = ""
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      inputValue:$newItemInputValue,
      confirm:()=> {
        console.log("新增目标项: %s", this.newItemInputValue)
        if (this.newItemInputValue === "" || !this.newItemInputValue) {
          return;
        }
        let nextId = new Date().getMilliseconds();
        let newTarget: SubTargetItemData = new SubTargetItemData(nextId.toString(), this.newItemInputValue, 0, CommonUntil.parse2ShowTimeStr(new Date()));
        CommonUntil.pushNewItem2Arr<SubTargetItemData>(newTarget, this.workTargetDataList)
        promptAction.showToast({
          message: '新增成功',
          duration: 1500,
          bottom: 60
        });
      }
    }),
    cancel:()=>{},
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })

  aboutToAppear() {
    console.log("===>>>SubTargetComp  build 之前执行aboutToAppear")
  }
  aboutToDisappear() {
    console.log("===>>>SubTargetComp  销毁 之前将dialogController置空")
    this.dialogController = undefined
  }


  // ui
  build() {
    Column() {
      // 子目标
      Row() {
        Row() {
          Text("子目标")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.ic_public_add_norm'))
            .width(22)
            .margin({left:5})
            .onClick(()=>{
              if (this.dialogController != undefined) {
                // 点击新增时，把编辑状态先清除掉
                this.checkboxGroupKeyArray = [];
                this.isEditStatus = false;
                this.dialogController.open()
              }
            })
        }

        // TODO 为啥点编辑后 高度会多一丢丢出来？
        Row() {
          if (!this.isEditStatus) {
            Text("编辑")
              .editAndCancelStyle()
              .transition({type: TransitionType.Insert, translate: { x: -20, y: 0}, opacity:0})
              .onClick(()=>{
                // 指定动画参数
                animateTo({duration:500}, ()=>{
                  this.isSubItemExpandStatus = false;
                  this.currentSubItemExpandIndex = -1;
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
            ForEach(this.workTargetDataList, (itemData, index) => {
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
              return JSON.stringify(itemData) + index;
            })
          }
          .width('100%')
          .height('100%')
          .divider({ strokeWidth: 10 })
        }
      }
      .layoutWeight(1)

      // 删除按钮
      if (this.isEditStatus) {
        Row(){
          Image($r('app.media.ic_public_delete')).width(30)
        }
        .margin({ top: 5, bottom: 10})
        .transition({type: TransitionType.All, scale: { x: 10, y: 0 }, opacity:0})
        .onClick(()=>{
          // 验证已经选择的条数
          if (this.checkboxGroupKeyArray.length === 0) {
            promptAction.showToast({
              message: '请至少选择一项',
              duration: 1500,
              bottom: 60
            });
          } else {
            AlertDialog.show(
              {
                title: '删除提示',
                message: `确认删除已选择的${this.checkboxGroupKeyArray.length}项吗？`,
                autoCancel: true,
                alignment: DialogAlignment.Bottom,
                gridCount: 4,
                offset: { dx: 0, dy: -20 },
                primaryButton: {
                  value: '取消',
                  action: () => {
                    console.info('Callback when the first button is clicked')
                  }
                },
                secondaryButton: {
                  value: '删除',
                  action: () => {
                    console.info('Callback when the second button is clicked')
                    this.workTargetDataList = CommonUntil.batchRemoveByKeyValues<SubTargetItemData>('subId', this.checkboxGroupKeyArray, this.workTargetDataList)
                    this.checkboxGroupKeyArray = [];
                    this.isEditStatus = false;
                    promptAction.showToast({
                      message: '删除成功',
                      duration: 1500,
                      bottom: 60
                    });
                  }
                },
                cancel: () => {
                  console.info('Closed callbacks')
                }
              }
            )
          }
        })
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

// 增加项目时候的弹窗
@CustomDialog
struct CustomDialogExample {
  @Link inputValue: string
  textValue: string

  controller: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Text('新增目标').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '请输入目标内容', text: this.textValue })
        .height(60)
        .width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
          .backgroundColor(0xffffff)
          .fontColor(Color.Black)
        Button('确认')
          .onClick(() => {
            this.inputValue = this.textValue
            this.controller.close()
            this.confirm()
          })
          .backgroundColor(0xffffff)
          .fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}
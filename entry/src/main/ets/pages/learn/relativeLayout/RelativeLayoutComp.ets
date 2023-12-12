import { ITitleAndNote } from '../common/CommonType';
import { TitleAndNoteComp } from '../common/comp/TitleAndNoteComp';

@Entry
@Component
export struct RelativeLayoutComp {
  listData: Array<string> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"];

  RelativeLayoutNotesData:ITitleAndNote = {
    title:"利用RelativeContainer容器进行相对布局",
    noteItemSpace: 4,
    noteList:[
      "1. 相对定位容器, 自身需要设置宽高, 且子组件必须设置id才能显示",
      "2. 相对定位容器内, 子组件默认位置在左上角, 需要子组件各自设置alignRules属性控制位置",
      "3. 子组件水平方向可调整left、middle、right属性; 垂直方向可调整top、center、bottom属性",
      "4. 子组件调整位置时, 锚点anchor可设置为父容器、或兄弟组件",
      "5. 父容器id固定为__container__"
    ]
  }

  // 是否展开ABC功能按钮
  @State ifExpandFeatureButton: boolean = false

  // 数据列表
  @Builder DataListShow() {
    List({ space: 10 }) {
      ForEach(this.listData,
        (item) => {
          ListItem() {
            Text(item)
          }
          .width("100%")
          .height(50)
          .backgroundColor($r("app.color.rank_secondary_border"))
          .borderRadius(10)
          .onClick(()=>{
            this.ifExpandFeatureButton = false
          })
        }
      )
    }
    .width("100%")
    .height("100%")
  }

  // 功能按钮 都相对于按钮1的位置布局
  @Builder FeatureButtonShow() {
    if (this.ifExpandFeatureButton) {
      // 按钮2，相对于按钮1的位置布局
      Button({ type: ButtonType.Circle }) {
        Text("A")
          .fontColor(Color.White)
          .fontSize(20)
          .textAlign(TextAlign.Center)
      }
      .width(60)
      .height(60)
      .backgroundColor(Color.Orange)
      .alignRules({
        bottom: {
          anchor: "bt1",
          align: VerticalAlign.Top
        },
        right: {
          anchor: "bt1",
          align: HorizontalAlign.End
        }
      })
      .offset({ y: -30 })
      .id("bt2")

      // 按钮3，相对于按钮1的位置布局
      Button({ type: ButtonType.Circle }) {
        Text("B")
          .fontColor(Color.White)
          .fontSize(20)
          .textAlign(TextAlign.Center)
      }
      .width(60)
      .height(60)
      .backgroundColor(Color.Green)
      .alignRules({
        bottom: {
          anchor: "bt1",
          align: VerticalAlign.Top
        },
        right: {
          anchor: "bt1",
          align: HorizontalAlign.Start
        }
      })
      .offset({ x: -10, y: -10 })
      .id("bt3")

      // 按钮4，相对于按钮1的位置布局
      Button({ type: ButtonType.Circle }) {
        Text("C")
          .fontColor(Color.White)
          .fontSize(20)
          .textAlign(TextAlign.Center)
      }
      .width(60)
      .height(60)
      .backgroundColor(Color.Yellow)
      .alignRules({
        bottom: {
          anchor: "bt1",
          align: VerticalAlign.Bottom
        },
        right: {
          anchor: "bt1",
          align: HorizontalAlign.Start
        }
      })
      .offset({ x: -30 })
      .id("bt4")
    }
  }


  build() {
    Column({ space: 10 }) {
      TitleAndNoteComp({titleAndNote: this.RelativeLayoutNotesData})

      // 注意点: List组件的父容器务必设置高度, 或者layoutWeight
      Stack({ alignContent: Alignment.BottomEnd }) {
        this.DataListShow();

        // 相对定位容器, 自身需要设置宽高, 且子组件必须设置id才能显示
        // 子组件尽量相对同一个元素进行相对布局
        RelativeContainer() {
          Button({ type: ButtonType.Circle, stateEffect: true }) {
            Text("功能")
              .fontColor(Color.White)
              .fontSize(20)
              .textAlign(TextAlign.Center)
          }
          .width(60)
          .height(60)
          .alignRules({
            bottom: {
              anchor: "__container__",
              align: VerticalAlign.Bottom
            },
            right: {
              anchor: "__container__",
              align: HorizontalAlign.End
            }
          })
          .id("bt1")
          .onClick(()=>{
            this.ifExpandFeatureButton = !this.ifExpandFeatureButton
          })

          // 功能按钮
          this.FeatureButtonShow()
        }
        .width(160)
        .height(160)
        .borderWidth(2)
        .borderColor(Color.Red)
      }
      .layoutWeight(1)

    }
    .width("100%")
    .height("100%")
    .backgroundColor("#eee")
    .padding(10)
  }
}
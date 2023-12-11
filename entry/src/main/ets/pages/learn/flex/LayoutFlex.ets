import { FontSize } from '../../../common/Constants'
import { ITitleAndNote } from '../common/CommonType'
import { TitleAndNoteComp } from '../common/comp/TitleAndNoteComp'
@Entry
@Component
export struct LayoutFlex {

  FlexRowTitleAndNotesData:ITitleAndNote = {
    title:"Flex做父容器的默认布局(单行、列)",
    noteItemSpace: 4,
    noteList:[
      "1. 子组件垂直(交叉轴)方向、水平(主轴)上都默认是Start",
      "2. FlexDirection.Row, 子组件需设置高度; FlexDirection.Column, 子组件需设置宽度",
      "3. FlexDirection.Row, 子组件宽之和超过父容器时, 不会溢出【默认自适应压缩】; 此时高度则相反且默认展示溢出内容",
      "4. FlexDirection.Column, 子组件高之和超过父容器时, 不会溢出【默认自适应压缩】; 此时宽度则相反且默认展示溢出内容",
      "5. 子组件存在主轴长度且超过父容器时, 子组件的压缩比例 ???",
      "6. 子组件设置flexGrow时【主轴长度设置会失效】, 用于控制获取剩余长度占比 【不要设置layoutWeight属性】",
    ]
  }

  build() {
    Column(){
      this.Flex_RowDefault_Layout()

    }
    .width("100%")
    .height("100%")
    .padding(10)

  }

  @Builder Flex_RowDefault_Layout() {
    Column({space:10}) {
      TitleAndNoteComp({titleAndNote: this.FlexRowTitleAndNotesData})

      // 用于对比
      Row() {
        Row() {
          Text("宽度50(标准)").fontSize(FontSize.SMALL)
        }
        .width(50)
        .height(50)
        .backgroundColor($r("app.color.rank_first_border"))

        Row() {
          Text("宽度50(标准)").fontSize(FontSize.SMALL)
        }
        .width(50)
        .height(50)
        .backgroundColor($r("app.color.rank_first_gradient_end"))

        Row() {
          Text("宽度200(标准)").fontSize(FontSize.SMALL)
        }
        .width(200)
        .height(50)
        .backgroundColor($r("app.color.rank_first_gradient_start"))

      }
      .width(300)
      .height(100)
      .backgroundColor($r("app.color.rank_secondary_gradient_start"))

      // TODO 测试子组件设置宽度时，伸缩比是多少？
      Flex({direction:FlexDirection.Row}){
        Row() {
          Text("固定宽度50").fontSize(FontSize.SMALL)
        }
        .height(50)
        .width(50)
        .backgroundColor($r("app.color.rank_first_border"))

        Row() {
          Text("固定宽度100").fontSize(FontSize.SMALL)
        }
        .height(50)
        .width(100)
        .backgroundColor($r("app.color.rank_first_gradient_end"))

        Row() {
          Text("固定宽度200").fontSize(FontSize.SMALL)
        }
        .height(50)
        .width(200)
        .backgroundColor($r("app.color.rank_first_gradient_start"))
      }
      .width(300)
      .height(100)
      .backgroundColor($r("app.color.rank_secondary_gradient_start"))

      // flexGrow
      Flex({direction:FlexDirection.Row}){

        Row() {
          Text("flexGrow=1").fontSize(FontSize.SMALL)
        }
        .height(50)
        .flexGrow(1)
        .flexShrink(1)
        .backgroundColor($r("app.color.rank_first_border"))

        Row() {
          Text("flexGrow=1").fontSize(FontSize.SMALL)
        }
        .flexGrow(1)
        .flexShrink(1)
        .height(50)
        .backgroundColor($r("app.color.rank_first_gradient_end"))

        Row() {
          Text("固定宽度200").fontSize(FontSize.SMALL)
        }
        .width(200)
        .height(50)
        .backgroundColor($r("app.color.rank_first_gradient_start"))
      }
      .width(300)
      .height(100)
      .backgroundColor($r("app.color.rank_secondary_gradient_start"))
    }
  }
}
import { ITextStyle, ITitleAndNote } from '../common/CommonType';
import { TitleAndNoteComp } from '../common/comp/TitleAndNoteComp';
@Entry
@Component
export struct LayoutRowColumn {

  RowTitleAndNotesData:ITitleAndNote = {
    title:"Row做父容器的默认布局",
    noteItemSpace: 4,
    noteList:[
      "1. 子组件默认是垂直方向居中, 水平(主轴)上是Start",
      "2. 子组件宽、高和超过父容器时, 会溢出, 默认是展示溢出部分的内容的 【默认不会自适应伸缩】",
      "3. 子组件设置layoutWeight属性, 控制获取剩余宽度占比 【layoutWeight比flexGrow优先级高】"]
  }
  ColumnTitleAndNotesData:ITitleAndNote = {
    title:"Column做父容器的默认布局",
    noteItemSpace: 4,
    noteList:[
      "1. 子组件默认是水平方向居中, 垂直(主轴)上是Top",
      "2. 子组件宽、高和超过父容器时, 会溢出, 默认是展示溢出部分的内容的 【默认不会自适应伸缩】",
      "3. 子组件设置layoutWeight属性, 控制获取剩余高度占比 【layoutWeight比flexGrow优先级高】"]
  }

  build() {
    // Row做父容器的布局
    // 1. 子组件默认是垂直方向居中, 水平(主轴)上是Start
    // 2. 子组件宽、高和超过父容器时, 会溢出, 默认是展示溢出部分的内容的! 【默认不会自适应伸缩】
    // 3. 子组件设置layoutWeight属性, 控制获取剩余宽度占比! 【layoutWeight比flexGrow优先级高】
    Column({space:20}){
      this.RowDefault_Layout();
      Blank()
      this.ColumnDefault_Layout();
    }
    .width("100%")
    .height("100%")
    .padding(10)
  }

  @Builder ColumnDefault_Layout() {
    Column({space:10}) {
      TitleAndNoteComp({titleAndNote: this.ColumnTitleAndNotesData})
      Column() {
        Row() {
          Text("固定高度50")
        }
        .width(100)
        .height(50)
        .backgroundColor($r("app.color.rank_first_border"))

        Row() {
          Text("剩余高度占比1")
        }
        .width(150)
        .layoutWeight(1)
        .backgroundColor($r("app.color.rank_first_gradient_end"))

        Row() {
          Text("剩余高度占比2")
        }
        .width(200)
        .layoutWeight(2)
        .backgroundColor($r("app.color.rank_first_gradient_start"))
      }
      .width(300)
      .height(200)
      .backgroundColor($r("app.color.rank_secondary_gradient_start"))
    }
  }

  @Builder RowDefault_Layout() {
    Column({space:10}) {
      TitleAndNoteComp({titleAndNote: this.RowTitleAndNotesData})
      Row() {
        Row() {
          Text("固定宽度100")
        }
        .width(100)
        .height(50)
        .backgroundColor($r("app.color.rank_first_border"))

        Row() {
          Text("剩余宽度占比1")
        }
        .height(50)
        .layoutWeight(1)
        .backgroundColor($r("app.color.rank_first_gradient_end"))

        Row() {
          Text("剩余宽度占比2")
        }
        .height(50)
        .layoutWeight(2)
        .backgroundColor($r("app.color.rank_first_gradient_start"))

      }
      .width(300)
      .height(100)
      .backgroundColor($r("app.color.rank_secondary_gradient_start"))
    }
  }
}

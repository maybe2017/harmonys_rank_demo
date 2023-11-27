@Entry
@Component
export default struct RowLayoutTest {

  // row布局
  // 1. 最外层Row必须给宽度100%
  // 2. Row中嵌套Row, Row容器中的元素(子Row元素) 是 水平布局
  build() {
      Row() {
        Row() {
          Text("<--")
          Text("this.title")
        }
        .width('40%').height(50)
        .backgroundColor(0xF5DEB3)
        .justifyContent(FlexAlign.Start)


        Row() {
          Text("-->")
          Text("this.title")
        }
        .width('40%')
        .height(50)
        .backgroundColor(0xF5DEB3)
        .justifyContent(FlexAlign.End)
      }
      .width('100%')
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceAround)
    }
}
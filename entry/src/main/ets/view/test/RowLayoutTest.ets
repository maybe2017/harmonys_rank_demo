@Entry
@Component
export default struct RowLayoutTest {

  // row布局
  // 1. 最外层Row必须给宽度100%
  // 2. Row中嵌套Row, Row容器中的元素(子Row元素) 是 水平布局
  build() {
    Column() {
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

      Divider().strokeWidth(2).color(Color.Red).margin(5)

      // 测试 row组件作为Column儿子组件 的属性情况
      // 怎么思考一个组件的位置，看他的父组件是什么！父组件的默认子组件布局是什么？
      // 从外层依次向里看，行的子组件则是垂直居中，列的子组件是水平居中！！
      // 如果不想让行的子组件垂直居中，有两种方式改位置，1是子组件自身设置alignSelf，2是父容器设置alignItems
      // 子组件自身设置alignSelf,只会影响子组件自身在父容器的位置；但是父容器设置alignItems，会影响全部子组件的布局
      Row() {
        Column() {
          Row() {
            Image($r('app.media.icon'))
              .height(40)
              .width(40)
          }
          .width(300)
          .height(300)
          .backgroundColor(Color.Orange)
          .alignSelf(ItemAlign.Start)
        }
        .backgroundColor(Color.Pink)
        .width('90%')
        .height(400)
      }
      .backgroundColor(Color.Gray)
      .width('100%')
      .height(500)
      .alignItems(VerticalAlign.Top)
    }
  }
}
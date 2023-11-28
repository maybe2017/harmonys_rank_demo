@Component
@Entry
export default struct WorkTargetComponent {
  completedCount: number = 0;
  totalCount: number = 0;
  updateTime: Date = new Date("2023-11-27 16:30:30")

  // ui
  build() {
    // Flex组件默认在主轴方向，在其父容器内自动拉升
    Column() {
      Flex({ direction: FlexDirection.Column }) {
        Text("AAA")
          .backgroundColor(Color.Red)
        .flexGrow(1)

        Text("BBB")
          .backgroundColor(Color.Brown)
          .flexGrow(3)
      }
      .width(200)
      .height(100)
      .backgroundColor(Color.Blue)


      Slider()
      // 当父容器是Row时，子组件1宽度是100%，在 子组件2有宽度时，子组件1设置flexGrow(1)会无视 子组件2，直接撑满父容器宽度，子组件2就会溢出
      // 上述情况，可以该用layoutWeight(1) 解决
      // 也可以将父容器换成Flex组件来解决，(子组件1设置flexGrow(1)拉升时，才会考虑子组件2的宽度)
      Row() {
        Text("AAA")
          .backgroundColor(Color.Red)
          .width("100%")
          .flexGrow(1)
          // .layoutWeight(1)

        Text("BBB")
          .backgroundColor(Color.Brown)
      }
      .width(200)
      .height(100)
      .backgroundColor(Color.Blue)


      Slider()

      Column() {
        Row(){
          Text("BBB")
          Text("AAA")
        }
        .width('100%')
        // .margin({left:20, right:50})
        .backgroundColor(Color.Orange)


        Row(){
          Text("DDD")
        }
        .layoutWeight(1)
        .backgroundColor(Color.Pink)
      }
      .width(300)
      .height(100)
      .padding(20)
      .backgroundColor(Color.Blue)
      .justifyContent(FlexAlign.Center)
    }
    .backgroundColor(Color.Gray)
  }
}



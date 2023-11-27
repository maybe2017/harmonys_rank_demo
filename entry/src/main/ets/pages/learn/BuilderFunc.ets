// 1. 写在struct或class中的 @Builder函数使用时，需要加上this前缀使用； 写在外面的全局函数，不能加this
// 2. @Builder函数内，不能显示写return返回

@Entry
@Component
struct BuilderFunc {
  @State message: string = '内部@Builder函数，使用时需要加this'
  @State message2: string = '外部@Builder的全局函数，声明时需加上function，使用时不能加this'
  @State textMsg: string = '@Extend注解可为 内部组件，增加`该组件`自身能扩展的样式'
  @State buttonClickCount: number = 0;

  build() {
    Column() {
      Row() {
        TextInput({placeholder:"第一个组件会自动获取到焦点"})
          .border({color:Color.Orange, width: 2})
          .borderRadius(10)
          .margin(20)
          .stateStyles({
            normal:{},
            focused: {

            },
            pressed:{.shadow({radius:10, color:Color.Red, offsetX:5, offsetY:5})}
          })
      }

      Row() {
        this.Item(this.message, 20, Color.Blue, FontWeight.Normal);
      }.commonStyle()

      Row() {
        Item2(this.message2, 20, Color.Red, FontWeight.Normal)
      }.commonStyle()

      Text(this.textMsg)
        .commonStyle()
        .textStyle(20, Color.Brown, FontWeight.Lighter);

      Button(this.buttonClickCount.toString())
        .commonStyle()
        .buttonStyle(() => {
          this.buttonClickCount++
        }).stateStyles({
        focused: {

        },
        pressed:{}
      })

    }
    .width('100%')
    .height('100%')
  }

  @Builder Item(msg: string, fs: number, fc: Color, fw: FontWeight) {
    Text(msg)
      .fontSize(fs)
      .fontWeight(fw)
      .fontColor(fc)
  }
}

@Builder function Item2(msg: string, fs: number, fc: Color, fw: FontWeight) {
  Text(msg)
    .fontSize(fs)
    .fontWeight(fw)
    .fontColor(fc)
}


// 组件的公用样式，可以使用@style注解统一起来
// 公用样式函数 不能有参数
// 设置不了文本样式
@Styles function commonStyle() {
  .width('100%')
  .height(60)
  .backgroundColor(Color.Gray)
  .margin(10)
  .borderStyle(BorderStyle.Solid)
  .borderRadius(10)
  .borderColor(Color.Black)
  .borderWidth(1)
  .opacity(0.5)
  .onClick(e => {
    AlertDialog.show(getAlertDialogParamWithConfirm(JSON.stringify(e.target)))
  })
}


// @Extend注解可以给内部组件，增加`该组件`自身能扩展的样式, 比如能给text组件增加文本样式，但是给button组件增加不了
// 可以设置参数
@Extend(Text) function textStyle(fs: number, fc: Color, fw: FontWeight) {
  .fontSize(fs)
  .fontColor(fc)
  .fontWeight(FontWeight.Bold)
}

@Extend(Button) function buttonStyle(clickFunc: () => void) {
  .type(ButtonType.Normal)
  .width(200)
  .height(40)
  .fontColor(Color.Black)
  .onClick(clickFunc)

}

// 弹窗
function getAlertDialogParamWithConfirm(content: string) {
  return {
    title: '弹窗',
    message: content,
    autoCancel: true,
    alignment: DialogAlignment.Default,
    gridCount: 4,
    offset: { dx: 0, dy: -20 },
    primaryButton: {
      value: '取消',
      action: () => {
        console.info('取消按钮被点击')
      }
    },
    secondaryButton: {
      value: '确认',
      action: () => {
        console.info('确认按钮被点击')
      }
    },
    cancel: () => {
      console.info('直接退出')
    }
  }
}

@Component
export default struct TodoItem {
  content: string;
  @State clicked: boolean = false;

  build() {
    Row() {
      Image(this.clicked ? $r('app.media.todolist_ic_ok') : $r('app.media.todolist_ic_default'))
        .width(40)
        .objectFit(ImageFit.Contain)
        .margin({ left: 20, right: 20 })
      Text(this.content ? this.content : "默认值")
        .TodoItem_textStyle(this.clicked);
    }
    .TodoItem_rowStyle(this.clicked)
    .onClick(() => {
      this.clicked = !this.clicked;
    })
  }
}

@Extend(Row) function TodoItem_rowStyle(clicked: boolean) {
  .width('90%')
  .height(60)
  .backgroundColor(Color.White)
  .borderRadius(20)
  .padding(5)
  .opacity(clicked ? 0.7 : 1)
  .justifyContent(FlexAlign.Start)
}

@Extend(Text) function TodoItem_textStyle(clicked: boolean) {
  .fontSize(20)
  .decoration({ type: clicked ? TextDecorationType.LineThrough : TextDecorationType.None })
}
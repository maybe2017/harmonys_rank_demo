import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'HarmonyOS 4.0'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .onClick(()=> {
        router.pushUrl({
          url: 'pages/TOTOList',
          params: {
            "Author" : "MaYu",
            "Age": 30
          }
        })
      })
    }
    .height('100%')
  }
}
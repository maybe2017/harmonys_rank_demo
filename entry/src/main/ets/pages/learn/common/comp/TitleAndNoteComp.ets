import { ITextStyle, ITitleAndNote } from '../CommonType';
@Component
export struct TitleAndNoteComp {
  titleAndNote: ITitleAndNote;
  build() {
    Column() {
      Text(this.titleAndNote.title).textStyle({fs:18, fw:FontWeight.Bold})
      Column({space:this.titleAndNote.noteItemSpace}) {
        ForEach(this.titleAndNote.noteList,
          (noteItem, index) => {
            Text(noteItem)
              .textStyle()
          },
          (noteItem, index) => {
            return index + "_" + JSON.stringify(noteItem)
          })
      }
      .margin({top:10, bottom:5})
      .alignItems(HorizontalAlign.Start)
    }
  }
}

@Extend(Text) function textStyle(textStyle?: ITextStyle) {
  .fontSize(textStyle?.fs)
  .fontColor(textStyle?.fc)
  .fontWeight(textStyle?.fw ? textStyle.fw : FontWeight.Medium)
}
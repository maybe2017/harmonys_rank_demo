// 标题与笔记参数约束
export interface ITitleAndNote {
  title: string
  noteList: Array<string>
  noteItemSpace?: number;
}



// text组件样式参数约束
export interface ITextStyle {
  fs?: number
  fc?: Color
  fw?: FontWeight
}
// text组件自定义扩展样式
@Extend(Text) function textStyle(textStyle?: ITextStyle) {
  .fontSize(textStyle?.fs)
  .fontColor(textStyle?.fc)
  .fontWeight(textStyle?.fw ? textStyle.fw : FontWeight.Medium)
}
import router from '@ohos.router';
import TodoItem from '../view/todolist/TodoItem';

let author = router.getParams()['Author'] as string;

@Entry
@Component
struct TOTOList {
  @State todoListDataArr: Array<string> = ["早起锻炼", "准备早餐", "敲打代码", "学习ArkTs", "看剧放松"]

  build() {
    Column({ space: 20 }) {
      Text(`Author: ${author}`).fontSize(40)

      ForEach(this.todoListDataArr,
        (item, index) => {
          TodoItem({ content: item })
        },
        (item, index) => {
          return index.toString();
        })
    }
    .width("100%")
    .height("100%")
    .backgroundColor('#eee')
  }
}
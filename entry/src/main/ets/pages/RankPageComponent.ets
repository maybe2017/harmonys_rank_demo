import RankVoteInfo from '../viewmodel/RankVoteInfo';
import TitleComponent from '../view/TitleComponent';
import ListItemComponent from '../view/ListItemComponent';
import { rankData1, rankData2 } from '../model/DataModel';
import { APP_EXIT_INTERVAL, Style, TIME, TITLE, WEIGHT } from '../common/Constants';

@Component
@Entry
struct RankPageComponent {

  @State sourceData1:Array<RankVoteInfo> = [];
  @State sourceData2:Array<RankVoteInfo> = [];
  @State refreshDataSource:boolean = false;

  aboutToAppear() {
    console.log("自定义组件声明周期 -- aboutToAppear(创建实例后, 执行build函数前) -- 开始初始化数据");
    this.sourceData1 = rankData1;
    this.sourceData2 = rankData2;
  }

  aboutToDisappear() {
    console.log("自定义组件声明周期 -- aboutToDisappear -- 释放资源避免资源泄露");
  }

  // 对于页面的入口组件 还有额外的3个生命周期函数
  onPageShow() {
    console.log("入口组件 -- onPageShow -- 页面显示");
  }
  onPageHide() {
    console.log("入口组件 -- onPageHide -- 页面隐藏(后台)");
  }
  onBackPress() : boolean {
    console.log("入口组件 -- onBackPress -- 系统返回操作, 返回ture表示页面自己处理返回逻辑");
    return false;
  }


  // ui
  build() {
    Column() {
      TitleComponent({ refreshDataSource: $refreshDataSource, title: TITLE });
      this.RankList(Style.CONTENT_WIDTH);
    }
  }

  @Builder RankList(widthValue: Length) {
    Column() {
      List() {
        ForEach(this.refreshDataSource ? this.sourceData1 : this.sourceData2,
          (item: RankVoteInfo, index?: number) => {
            ListItem() {
              ListItemComponent({ index: (Number(index) + 1), name: item.name, vote: item.vote,
                refreshDataSource: this.refreshDataSource
              })
            }
          }, (item: RankVoteInfo) => JSON.stringify(item))
      }
      .width(WEIGHT)
      .height(Style.LIST_HEIGHT)
      .divider({ strokeWidth: Style.STROKE_WIDTH })
    }
    .padding({
      left: Style.RANK_PADDING,
      right: Style.RANK_PADDING
    })
    .borderRadius(Style.BORDER_RADIUS)
    .width(widthValue)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }



}


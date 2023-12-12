import { UserProfileUIDataInterface } from '../common/CommonType'
import { arrowForwardImgUrl } from '../common/Constants'

@Entry
@Component
export struct ProfileInfoComp {

  // 用户信息界面ui元素数据
  @State uiDataList: UserProfileUIDataInterface[] = [
    {
      title: "服务",
      img: "https://www.itying.com/images/listimg/icon/01.jpg"
    },
    {
      title: "收藏",
      img: "https://www.itying.com/images/listimg/icon/02.jpg"
    },
    {
      title: "朋友圈",
      img: "https://www.itying.com/images/listimg/icon/03.jpg"
    },
    {
      title: "视频号",
      img: "https://www.itying.com/images/listimg/icon/04.jpg"
    },
    {
      title: "卡包",
      img: "https://www.itying.com/images/listimg/icon/05.jpg"
    },
    {
      title: "表情",
      img: "https://www.itying.com/images/listimg/icon/06.jpg"
    },
    {
      title: "设置",
      img: "https://www.itying.com/images/listimg/icon/07.jpg"
    }
  ]

  build() {

    Column() {
      List({ space: 10 }) {
        // 头部个人信息
        ListItem() {

        }
        .width("100%")
        .height(150)
        .backgroundColor(Color.White)

        // 服务
        ListItem() {
          this.FeatureRowComp(this.uiDataList[0])
        }.commonListItemStyle()

        // 中间功能列表
        // ListItem里面只能包含一个子组件，如果想包含多个, 将多个组件包裹到一个父组件中即可
        ListItem() {
          Column() {
            ForEach(this.uiDataList, (item, index) => {
              if (index > 0 && index < this.uiDataList.length - 1) {
                this.FeatureRowComp(item, true)
                // 分割线
                Divider()
                  .strokeWidth(1)
                  .color("#eee")
                  .padding({ left: 20 })
              }
            })
          }
        }
        .width("100%")
        .backgroundColor(Color.White)

        // 设置
        ListItem() {
          this.FeatureRowComp(this.uiDataList[this.uiDataList.length-1])
        }.commonListItemStyle()
      }
      .width("100%")
      .height("100%")
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#eee")
  }

  // 功能行构造函数
  @Builder FeatureRowComp(uiData: UserProfileUIDataInterface, addHeightAndPadding?: boolean) {
    Row() {
      Row({ space: 10 }) {
        Image(uiData.img)
          .width(28)
          .height(28)
          .objectFit(ImageFit.Cover)
        Text(uiData.title)
      }

      Image(arrowForwardImgUrl)
        .width(28)
        .height(28)
        .objectFit(ImageFit.Cover)
    }
    .commonFeatureRowStyle(addHeightAndPadding)
  }
}

// Row组件的公共样式
// addHeightAndPadding为true则设置height、padding
@Extend(Row) function commonFeatureRowStyle(addHeightAndPadding: boolean) {
  .width("100%")
  .height(addHeightAndPadding ? 50 : undefined)
  .padding(addHeightAndPadding ? 10 : undefined)
  .justifyContent(FlexAlign.SpaceBetween)
}

@Extend(ListItem) function commonListItemStyle() {
  .width("100%")
  .height(50)
  .padding(10)
  .backgroundColor(Color.White)
}
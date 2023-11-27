import SubTargetComp from '../view/workTarget/SubTargetComp';
import WorkTargetComponent from '../view/workTarget/WorkTargetComp';
import testDataArr,{SubTargetItemData} from '../viewmodel/workTarget/SubTargetItemData';

@Entry
@Component
struct WorkTargetPage {
  @State testDataArr: Array<SubTargetItemData> = testDataArr;

  build() {
    Column() {
      WorkTargetComponent({totalCount:testDataArr.length});
      SubTargetComp({testDataArrJson: JSON.stringify(testDataArr)});
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#eee")
  }
}
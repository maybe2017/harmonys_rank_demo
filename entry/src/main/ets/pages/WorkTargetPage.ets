import SubTargetComp from '../view/workTarget/SubTargetComp';
import WorkTargetComponent from '../view/workTarget/WorkTargetComp';
import WorkTargetDataModel,{CommonUntil, SubTargetItemData} from '../viewmodel/workTarget/SubTargetItemData';

@Entry
@Component
struct WorkTargetPage {
  @State workTargetDataList: Array<SubTargetItemData> = WorkTargetDataModel.testDataArr;
  @State @Watch('reCalcStateData') refreshParentComp: boolean = false;

  totalCount: number = 0;
  completedCount: number = 0;
  lastUpdateTimeStr: string = "2023-11-27 16:30:30"

  // TODO 居然没变？？为啥？
  aboutToAppear() {
    console.log("===>>>最外层组件的aboutToAppear被调用， 元素:%s", JSON.stringify(this.workTargetDataList))
    this.totalCount = this.workTargetDataList.length;
    this.completedCount = this.workTargetDataList.filter(item => item.progress === 100).length;
    this.lastUpdateTimeStr = CommonUntil.getLastUpdateTime<SubTargetItemData>(this.workTargetDataList);
  }


  // 重新计算子组件依赖的 状态变量
  reCalcStateData(propName: string): void {
    this.aboutToAppear();
  }

  build() {
    Column() {
      WorkTargetComponent({totalCount:this.totalCount, completedCount:this.completedCount, lastUpdateTimeStr:this.lastUpdateTimeStr});
      SubTargetComp({workTargetDataList: $workTargetDataList, refreshParentComp:$refreshParentComp});
    }
    .width('100%')
    .height('100%')
    .padding({left:12, right:12})
    .backgroundColor("#eee")
  }
}
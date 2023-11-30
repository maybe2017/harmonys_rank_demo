import SubTargetComp from '../view/workTarget/SubTargetComp';
import WorkTargetComponent from '../view/workTarget/WorkTargetComp';
import WorkTargetDataModel,{CommonUntil, SubTargetItemData} from '../viewmodel/workTarget/SubTargetItemData';

@Entry
@Component
struct WorkTargetPage {
  @State @Watch('test') workTargetDataList: Array<SubTargetItemData> = WorkTargetDataModel.testDataArr;
  // 重新计算整体进度
  @Provide @Watch('reCalcOverallProgress') refreshOverallProgress: boolean = false;

  @State totalCount: number = 0;
  @State completedCount: number = 0;
  @State lastUpdateTimeStr: string = "2023-11-27 16:30:30"

  aboutToAppear() {
    console.log("===>>>最外层组件的aboutToAppear被调用， 元素:%s", JSON.stringify(this.workTargetDataList))
    this.totalCount = this.workTargetDataList.length;
    this.completedCount = this.workTargetDataList.filter(item => item.progress === 100).length;
    this.lastUpdateTimeStr = CommonUntil.getLastUpdateTime<SubTargetItemData>(this.workTargetDataList);
  }

  // 重新计算子组件依赖的 状态变量
  reCalcOverallProgress(propName: string): void {
    console.log("===>>> 最外层组件的aboutToAppear监听到refreshOverallProgress发生变化 !!!  <<<=====")
    this.aboutToAppear();
  }
  test(propName: string): void {
    console.log("===>>> 最外层组件的aboutToAppear监听到workTargetDataList发生变化 !!!  <<<=====")
  }

  build() {
    Column() {
      WorkTargetComponent({totalCount:this.totalCount, completedCount:this.completedCount, lastUpdateTimeStr:this.lastUpdateTimeStr});
      SubTargetComp({workTargetDataList: $workTargetDataList});
    }
    .width('100%')
    .height('100%')
    .padding({left:12, right:12})
    .backgroundColor("#eee")
  }
}
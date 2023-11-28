export class SubTargetItemData {

  subId:string;
  subTitle:string;
  progress:string;
  updateTimeStr:string;

  constructor(subId:string, subTitle:string, progress:string, updateTimeStr:string) {
    this.subId = subId;
    this.subTitle = subTitle;
    this.progress = progress;
    this.updateTimeStr = updateTimeStr;
  }
}

// 日期对象没有标准的JSON表示 转化json后就可能转不回来了
const testDataArr:Array<SubTargetItemData> = [];
const testData1:SubTargetItemData = new SubTargetItemData("0", "目标一", "26%", "2023-11-26 15:20:03");
const testData2:SubTargetItemData = new SubTargetItemData("1", "目标二", "33%", "2023-11-27 19:58:29");
const testData3:SubTargetItemData = new SubTargetItemData("2", "目标三", "49%", "2023-11-27 09:05:52");
const testData4:SubTargetItemData = new SubTargetItemData("3", "目标四", "80%", "2023-11-29 12:34:01");
const testData5:SubTargetItemData = new SubTargetItemData("4", "目标五", "72%", "2023-11-29 12:34:01");
const testData6:SubTargetItemData = new SubTargetItemData("5", "目标六", "61%", "2023-11-29 12:34:01");
const testData7:SubTargetItemData = new SubTargetItemData("6", "目标七", "39%", "2023-11-29 12:34:01");
const testData8:SubTargetItemData = new SubTargetItemData("7", "目标八", "51%", "2023-11-29 12:34:01");
const testData9:SubTargetItemData = new SubTargetItemData("8", "目标九", "43%", "2023-11-29 12:34:01");
testDataArr.push(testData1);
testDataArr.push(testData2);
testDataArr.push(testData3);
testDataArr.push(testData4);
testDataArr.push(testData5);
testDataArr.push(testData6);
testDataArr.push(testData7);
testDataArr.push(testData8);
testDataArr.push(testData9);

export default testDataArr;
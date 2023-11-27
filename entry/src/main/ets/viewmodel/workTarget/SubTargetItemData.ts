export class SubTargetItemData {

  subId:string;
  subTitle:string;
  progress:string;
  updateTime:Date;

  constructor(subId:string, subTitle:string, progress:string, updateTime:Date) {
    this.subId = subId;
    this.subTitle = subTitle;
    this.progress = progress;
    this.updateTime = updateTime;
  }
}

// 日期对象没有标准的JSON表示 转化json后就可能转不回来了
const testDataArr:Array<SubTargetItemData> = [];
const testData1:SubTargetItemData = new SubTargetItemData("0", "目标一", "33%", new Date("2023-11-26 15:20:03"));
const testData2:SubTargetItemData = new SubTargetItemData("1", "目标二", "56%", new Date("2023-11-27 19:58:29"));
const testData3:SubTargetItemData = new SubTargetItemData("2", "目标三", "49%", new Date("2023-11-27 09:05:52"));
const testData4:SubTargetItemData = new SubTargetItemData("3", "目标四", "6%", new Date("2023-11-29 12:34:01"));
testDataArr.push(testData1);
testDataArr.push(testData2);
testDataArr.push(testData3);
testDataArr.push(testData4);

export default testDataArr;
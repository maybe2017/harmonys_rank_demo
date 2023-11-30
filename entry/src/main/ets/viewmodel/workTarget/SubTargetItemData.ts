export class SubTargetItemData {
  subId: string;
  subTitle: string;
  progress: number;
  updateTimeStr: string;

  constructor(subId: string, subTitle: string, progress: number, updateTimeStr: string) {
    this.subId = subId;
    this.subTitle = subTitle;
    this.progress = progress;
    this.updateTimeStr = updateTimeStr;
  }
}

class WorkTargetDataModel {
  // 日期对象没有标准的JSON表示 转化json后就可能转不回来了
  testDataArr: Array<SubTargetItemData> = [];

  constructor() {
    this.testDataArr.push(new SubTargetItemData("0", "目标一", 26, "2023-11-26 15:20:03"));
    this.testDataArr.push(new SubTargetItemData("1", "目标二", 33, "2023-11-27 19:58:29"));
    this.testDataArr.push(new SubTargetItemData("2", "目标三", 49, "2023-11-27 09:05:52"));
    this.testDataArr.push(new SubTargetItemData("3", "目标四", 80, "2023-11-29 12:34:01"));
    // this.testDataArr.push(new SubTargetItemData("4", "目标五", 72, "2023-11-29 15:01:55"));
    // this.testDataArr.push(new SubTargetItemData("5", "目标六", 61, "2023-11-29 16:34:25"));
    // this.testDataArr.push(new SubTargetItemData("6", "目标七", 39, "2023-11-30 08:27:42"));
    // this.testDataArr.push(new SubTargetItemData("7", "目标八", 51, "2023-11-29 06:16:37"));
    // this.testDataArr.push(new SubTargetItemData("8", "目标九", 43, "2023-11-30 15:34:07"));
    // this.batchRemoveBySubIds(["7","8"])
  }

  // public pushNewTargetData(subTitle: string): void {
  //   let currentMaxId = Math.max.call(Math, this.testDataArr.map(i => {return i.subId}));
  //   let nextId = Number.parseInt(currentMaxId) + 1;
  //   let newTarget: SubTargetItemData = new SubTargetItemData(nextId.toString(), subTitle, 0, CommonUntil.parse2ShowTimeStr(new Date));
  //   this.testDataArr.push(newTarget);
  // }
  //
  // public batchRemoveBySubIds(subIds: Array<string>): void {
  //   console.warn("删除动作subIds: %s, 删除前剩余元素个数: %d", JSON.stringify(subIds), this.testDataArr.length)
  //   this.testDataArr = this.testDataArr.filter((i) => !subIds.includes(i.subId));
  //   console.warn("删除后剩余元素个数: %d", this.testDataArr.length)
  // }
  //
  // public getLastUpdateTime(): string {
  //   let lastUpdateTimeStr: string = '';
  //   for (let index = 0; index < this.testDataArr.length; index++) {
  //     const element = this.testDataArr[index];
  //     lastUpdateTimeStr = lastUpdateTimeStr > element.updateTimeStr ? lastUpdateTimeStr : element.updateTimeStr;
  //   }
  //   return lastUpdateTimeStr;
  // }
}

export class CommonUntil {
  public static parse2ShowTimeStr(updateTime: Date): string {
    return "" + updateTime.getFullYear()
    + "/" + (updateTime.getMonth() + 1)
    + "/" + updateTime.getDate() + " " + updateTime.getHours()
    + ":" + updateTime.getMinutes()
    + ":" + updateTime.getSeconds();
  }

  public static pushNewItem2Arr<T>(newItem: T, originArr:Array<T>): Array<T> {
    originArr.push(newItem);
    return originArr;
  }

  public static batchRemoveByKeyValues<T>(key: string, keyValues: Array<string>, originArr:Array<T>): Array<T>  {
    console.warn("删除动作[key: %s, values: %s], 删除前剩余元素个数: %d", JSON.stringify(key), JSON.stringify(keyValues), originArr.length)
    originArr = originArr.filter((i) => !keyValues.includes(i[key]));
    console.warn("删除后剩余元素个数: %d", originArr.length)
    return originArr;
  }

  public static getLastUpdateTime<T>(originArr:Array<T>): string {
    let lastUpdateTimeStr: string = '';
    for (let index = 0; index < originArr.length; index++) {
      const element = originArr[index];
      lastUpdateTimeStr = lastUpdateTimeStr > element['updateTimeStr'] ? lastUpdateTimeStr : element['updateTimeStr'];
    }
    return lastUpdateTimeStr;
  }
}

export default new WorkTargetDataModel();
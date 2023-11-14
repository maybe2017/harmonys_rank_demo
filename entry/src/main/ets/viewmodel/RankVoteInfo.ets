// 只能是ets文件 ts文件里面没有Resource类型
export default class RankVoteInfo {
  public  id: string;
  public name:Resource;
  public vote:string;

  constructor(id: string, name:Resource, vote:string) {
    this.id = id;
    this.name = name;
    this.vote = vote;
  }

}
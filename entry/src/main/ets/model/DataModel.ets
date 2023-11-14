import RankVoteInfo from '../viewmodel/RankVoteInfo';

// 数据源
export { rankData1, rankData2 }
const rankData1: Array<RankVoteInfo> = [
  new RankVoteInfo('1', $r('app.string.fruit_apple'), '12080'),
  new RankVoteInfo('2', $r('app.string.fruit_grapes'), '10320'),
  new RankVoteInfo('3', $r('app.string.fruit_watermelon'), '9801'),
  new RankVoteInfo('4', $r('app.string.fruit_banana'), '8431'),
  new RankVoteInfo('5', $r('app.string.fruit_pineapple'), '7546'),
  new RankVoteInfo('6', $r('app.string.fruit_durian'), '7431'),
  new RankVoteInfo('7', $r('app.string.fruit_red_grape'), '7187'),
  new RankVoteInfo('8', $r('app.string.fruit_pears'), '7003'),
  new RankVoteInfo('9', $r('app.string.fruit_carambola'), '6794'),
  new RankVoteInfo('10', $r('app.string.fruit_guava'), '6721')
];

const rankData2: RankVoteInfo[] = [
  new RankVoteInfo('11', $r('app.string.fruit_watermelon'), '8836'),
  new RankVoteInfo('12', $r('app.string.fruit_apple'), '8521'),
  new RankVoteInfo('13', $r('app.string.fruit_banana'), '8431'),
  new RankVoteInfo('14', $r('app.string.fruit_grapes'), '7909'),
  new RankVoteInfo('15', $r('app.string.fruit_red_grape'), '7547'),
  new RankVoteInfo('16', $r('app.string.fruit_pears'), '7433'),
  new RankVoteInfo('17', $r('app.string.fruit_pineapple'), '7186'),
  new RankVoteInfo('18', $r('app.string.fruit_durian'), '7023'),
  new RankVoteInfo('19', $r('app.string.fruit_guava'), '6794'),
  new RankVoteInfo('20', $r('app.string.fruit_carambola'), '6721')
];
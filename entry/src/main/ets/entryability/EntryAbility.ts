import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
// 应用组件: 应用app的基本组成单位，是应用的运行入口 => 可派生扩展能力的【UIAbility组件、ExtensionAbility组件】

// 1. UIAbility的生命周期只包含创建/销毁/前台/后台等状态，与显示相关的状态通过WindowStage的事件暴露给开发者
// 2. 每个UIAbility类实例都会与一个WindowStage类实例绑定，该类提供了应用进程内窗口管理器的作用。
// WindowStage类实例它包含一个主窗口。也就是说UIAbility通过WindowStage持有了一个窗口，该窗口为ArkUI提供了绘制区域

// 3. 系统会先创建AbilityStage实例(Module级别的组件容器!!【1:1】 HAP在运行期首次加载时, 都会创建一个AbilityStage类实例，对该Module进行初始化等操作!!!),
// 1个AbilityStage实例 -> n个UIAbility类实例
// 每个UIAbility类实例都会与该实例产生关联。开发者可以使用AbilityStage获取该HAP中UIAbility实例的运行时信息

// 4. 每个UIAbility中都包含了一个Context属性，提供操作Ability、获取Ability的配置信息、应用向用户申请授权等能力
export default class EntryAbility extends UIAbility {
  // UIAbility实例创建完成时触发，系统会调用onCreate()回调
  // 可以在该回调中进行应用初始化操作，例如变量定义、资源加载等，用于后续的UI界面展示
  onCreate(want, launchParam) {
    // want: 调用方UIAbility传过来的参数 (如果app内存在多个UIAbility【可以在应用的一个Module中，也可以在的不同Module中】)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  // UIAbility通过WindowStage持有了一个窗口，该窗口为ArkUI提供了绘制区域
  // 生命周期进入Foreground之前，系统会创建一个WindowStage。
  // WindowStage创建完成后会进入onWindowStageCreate()回调，可以在该回调中设置UI界面加载、设置WindowStage的事件订阅
  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    // 注意此处 与路由处 main_pages.json 都得改
    // windowStage.loadContent('pages/RankPageComponent', (err, data) => {
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  // 在UIAbility的UI界面【可见之前】，申请系统需要的资源，或者重新申请在onBackground()中释放的资源
  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  // 在UIAbility实例销毁之前，则会先进入onWindowStageDestroy()回调，可以在该回调中释放UI界面资源
  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  // 在UIAbility的UI界面【完全不可见之后】，释放UI界面不可见时无用的资源，或者在此回调中执行较为耗时的操作，例如状态保存等
  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  // 进行系统资源的释放、数据的保存等操作
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
}

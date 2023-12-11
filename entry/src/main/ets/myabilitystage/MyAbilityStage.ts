import AbilityStage from '@ohos.app.ability.AbilityStage';

// 1. AbilityStage实例与model 关系为1:1, 即一个Module拥有一个AbilityStage
// 2. AbilityStage实例与UIAbility实例的关系，根据UIAbility实例的不同启动模式，关系为1:n
// 3. 需要在module.json5配置文件中，通过配置srcEntry参数来指定模块对应的代码路径，以作为HAP加载的入口
export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    // 应用的HAP在首次加载的时，为该Module初始化操作
    // 开始加载对应Module的第一个UIAbility`实例之前`会先创建AbilityStage，并在AbilityStage创建完成之后执行其onCreate()生命周期回调。
    // AbilityStage模块提供在Module加载的时候，通知开发者，可以在此进行该Module的初始化（如资源预加载，线程创建等）能力。
  }

  onAcceptWant(want) {
    // 仅UIAbility指定实例模式（specified）启动模式下触发
    return "MyAbilityStage";
  }

  onMemoryLevel(level) {
    // 背景: 应用被切换到后台时，系统会将在后台的应用保留在缓存中。即使应用处于缓存中，也会影响系统整体性能。
    // 背景: 当系统资源不足时，系统会通过多种方式从应用中回收内存，必要时会完全停止应用，从而释放内存用于执行关键任务
    // 目的:【为避免系统停止用户的应用进程】=> 在该方法内`订阅系统内存的变化情况`，释放不必要的资源
  }

  onConfigurationUpdated() {
    // 当系统全局配置发生变更时触发的事件，系统语言、深浅色等，配置项目前均定义在Configuration类中
  }
}
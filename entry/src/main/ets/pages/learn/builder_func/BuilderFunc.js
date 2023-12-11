"use strict";
// 1. 写在struct或class中的 @Builder函数使用时，需要加上this前缀使用； 写在外面的全局函数，不能加this
// 2. @Builder函数内，不能显示写return返回
struct BuilderFunc extends   {
    constructor(// 1. 写在struct或class中的 @Builder函数使用时，需要加上this前缀使用； 写在外面的全局函数，不能加this
    // 1. 写在struct或class中的 @Builder函数使用时，需要加上this前缀使用； 写在外面的全局函数，不能加this
// 2. @Builder函数内，不能显示写return返回

    ) {// 1. 写在struct或class中的 @Builder函数使用时，需要加上this前缀使用； 写在外面的全局函数，不能加this
        // 2. @Builder函数内，不能显示写return返回
    }
    build() {
            .width('100%')
            .height('100%');
    }
    Item(msg, fs, fc, fw) {
            .fontSize(fs)
            .fontWeight(fw)
            .fontColor(fc);
    }
}
function Item2(msg, fs, fc, fw) {
        .fontSize(fs)
        .fontWeight(fw)
        .fontColor(fc);
}
// 组件的公用样式，可以使用@style注解统一起来
// 公用样式函数 不能有参数
// 设置不了文本样式
function commonStyle() {
    
  
        .width('100%')
        .height(60)
        .backgroundColor(Color.Gray)
        .borderStyle(BorderStyle.Solid)
        .opacity(0.5);
}
// @Extend注解可以给内部组件，增加`该组件`自身能扩展的样式
function rowStyle() {
}
//# sourceMappingURL=BuilderFunc.js.map
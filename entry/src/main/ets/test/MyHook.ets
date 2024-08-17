import { hilog } from '@kit.PerformanceAnalysisKit';

import { MiniHook } from 'minihook/src/main/ets/decoration/minihook';
import { Test } from './Test';


export class MyHook {

 // MiniHook 第一个参数为hook的类，第二参数为hook的函数， 定义一个需要替换的函数，其中必须要有一个参数，即origin 为你要hook的函数的类型
  @MiniHook(Test,"myhook")
  stubFunc1(origin: () => void) {
    hilog.error(0, "hello", "前面插入一条日志")
    origin()
    hilog.error(0, "hello", "后面插入一条日志")
  }

  @MiniHook(Test,"myhook2")
  stubFunc2(param: number, origin: (param: number) => void) {
    hilog.error(0, "hello", "修改param参数为2")
    origin(2)
  }

  @MiniHook(Test,"myhook3")
  stubFunc3(param: number, origin: (param: number) => number) {
    let result = origin(param)
    hilog.error(0, "hello", "stubFunc " + result)
    return 3
  }


}
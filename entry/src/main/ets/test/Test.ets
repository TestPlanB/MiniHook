import { hilog } from '@kit.PerformanceAnalysisKit'

export class Test {
  myhook() {
    hilog.error(0, "hello", "myhook")
  }

  // 带参数的情况
  myhook2(param: number) {
    hilog.error(0, "hello", "myhook2 " + param)
  }

  // 带返回值的情况
  myhook3(param: number): number {
    hilog.error(0, "hello", "myhook3 " + param)
    return param + 1
  }
}


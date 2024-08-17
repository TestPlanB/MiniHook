# 使用方法（usage）
@MiniHook 修饰一个方法，第一个参数为hook类（构造函数），第二个为方法名

构造hook方法，如stubFunc2，参数与被hook方法保持一致，最后新增一个原函数方法对象

```
  被hook函数举例子，位于Test类中
  // 带参数的情况
  myhook2(param: number) {
    hilog.error(0, "hello", "myhook2 " + param)
  }
  hook方法
  @MiniHook(Test,"myhook2")
  stubFunc2(param: number, origin: (param: number) => void) {
    hilog.error(0, "hello", "修改param参数为2")
    origin(2)
  }
```

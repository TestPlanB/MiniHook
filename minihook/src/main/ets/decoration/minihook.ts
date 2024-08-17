import { hookFunc } from '../hook/hookcore';

// hook 装饰器
export function MiniHook(callTarget: any, action: any) {
  return function (target: any, propertyKey: string | symbol, descriptor: PropertyDescriptor) {
    const tempMethod = descriptor.value;
    hookFunc(callTarget, action, tempMethod)
  };
}

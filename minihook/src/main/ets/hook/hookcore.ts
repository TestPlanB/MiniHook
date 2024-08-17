export function hookFunc(target, action, temp) {
  let origin = target[action]
  let protoTypeOrigin = target.prototype[action]

  let destination = origin ?? protoTypeOrigin

  if (!destination) {
    throw new Error(`target not found `);
  }

  let isPrototype = protoTypeOrigin != null && protoTypeOrigin != undefined

  if (destination) {
    // 替换原有函数为插桩函数
    let copyOrigin = isPrototype ? target.prototype : target

    const descriptor = Object.getOwnPropertyDescriptor(copyOrigin, action);

    if (descriptor && !descriptor.writable) {
      throw new Error(`target is an unwritable obj `);
    }

    copyOrigin[action] = function (...args: any[]) {
      if (temp) {
        args.push(destination)
        return temp.apply(this, args);
      }
    }
  }
}

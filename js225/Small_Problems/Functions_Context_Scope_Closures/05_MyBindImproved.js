function myBind(func, context, ...args) {
  return function(...moreArgs) {
    return func.apply(context, args.concat(moreArgs));
  }
}
extension ScopeFunctionLet<T extends Object> on T {
  /// Calls the specified function [block] with `this` value as its argument and
  /// returns its result.
  R let<R>(R Function(T self) block) => block(this);
}

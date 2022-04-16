extension ScopeFunctionAlso<T extends Object> on T {
  /// Calls the specified function [block] with `this` value as its argument and
  /// returns `this` value.
  T also(void Function(T self) block) {
    block(this);
    return this;
  }
}

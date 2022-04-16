extension ScopeFunctionAlso<T extends Object> on T {
  /// Calls the specified function [block] with `this` value as its argument and
  /// returns `this` value.
  ///
  /// Function signature in Kotlin:
  /// ```kt
  /// inline fun <T> T.also(block: (T) -> Unit): T
  /// ```
  T also(void Function(T self) block) {
    block(this);
    return this;
  }
}

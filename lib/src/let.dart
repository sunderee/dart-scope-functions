extension ScopeFunctionLet<T extends Object> on T {
  /// Calls the specified function [block] with `this` value as its argument and
  /// returns its result.
  ///
  /// Function signature in Kotlin:
  /// ```kt
  /// inline fun <T, R> T.let(block: (T) -> R): R
  /// ```
  R let<R>(R Function(T self) block) => block(this);
}

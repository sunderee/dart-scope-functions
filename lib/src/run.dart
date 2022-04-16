/// Calls the specified function [block] and returns its result.
///
/// Function signature in Kotlin:
/// ```kt
/// inline fun <R> run(block: () -> R): R
/// ```
R run<R>(R Function() block) => block();

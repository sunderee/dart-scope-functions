# dart_scope_functions

Kotlin scope functions in Dart. This documentation is based off of [Kotlin's official documentation](https://kotlinlang.org/docs/scope-functions.html). Currently supported functions are

-   `let`
-   `run`
-   `also`

## Documentation

### `let`

`let` can be used to invoke one or more functions on results of call chains, to execute a code block with only non-null values, or to introduce a local variable with a limited scope for improving code readability.

```dart
final numbers = ["one", "one", "two", "three", "four", "five"];
  numbers
      .map((String it) => it.length)
      .where((int it) => it > 3)
      .let((Iterable<int> it) => print(it));
```

### `run`

This version of `run` is merely a convenience method that allows executing a block of several statements where an expression is required.

```dart
final object = run(() {
    final result = _SampleObject();
    result.url = 'http://github.com/sunderee';
    result.port = 80;
    result.let((it) => it.url = it.url.replaceFirst('http', 'https'));

    return result;
  });
```

### `also`

`also` is used to perform actions that take the context object as an argument, should you need a reference to the object rather than its properties/functions.

```dart
List<String> numbers = ["one", "two", "three"];
  numbers
      .also((it) => it.sort())
      .add("four");
```

## Disclaimer

Kotlin's standard library contains five scope functions, while ours provides only three, and that's due to the limitations of the Dart programming language. Missing functions are `run` (called on a receiver object), `with` and `apply`.

I was unable to find an elegant (or even possible) way of implementing them, since referring to the context object via lambda receiver is impossible in Dart.

From the official documentation:

> `run`, `with`, and `apply` refer to the context object as a lambda receiver - by keyword `this`. Hence, in their lambdas, the object is available as it would be in ordinary class functions.

We could "cheat" around `with` using something like

```dart
R withFun<T, R>(T receiver, R Function (T self) block) {
    return block(receiver);
}
```

but that is just an over-complicated `let`, without the advantages of the actual `with`.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/sunderee)

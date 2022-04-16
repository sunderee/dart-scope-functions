import 'package:dart_scope_functions/dart_scope_functions.dart';

void main() {
  // let
  print('--- let ---');
  _letExample();

  // run
  print('--- run ---');
  _runExample();

  // also
  print('--- also ---');
  _alsoExample();
}

void _letExample() {
  final numbers = ["one", "one", "two", "three", "four", "five"];
  numbers
      .map((String it) => it.length)
      .where((int it) => it > 3)
      .let((Iterable<int> it) => print(it));
}

class _SampleObject {
  String url = '';
  int port = -1;
}

void _runExample() {
  final object = run(() {
    final result = _SampleObject();
    result.url = 'http://github.com/';
    result.port = 80;
    result.let((it) => it.url = it.url.replaceFirst('http', 'https'));

    return result;
  });
  print('Object ${object.url}, ${object.port}');
}

void _alsoExample() {
  List<String> numbers = ["one", "two", "three"];
  numbers
      .also((it) => print('elements before adding new one: $it'))
      .add("four");
  print('elements now: $numbers');
}

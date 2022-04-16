import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:test/test.dart';

void main() {
  group('let', () {
    test(
      'result of call chains',
      () {
        final numbers = ["one", "one", "two", "three", "four", "five"];
        var resultsNumber = 0;
        numbers
            .map((String it) => it.length)
            .where((int it) => it > 3)
            .let((Iterable<int> it) => resultsNumber = it.length);

        expect(resultsNumber, 3);
      },
    );

    test(
      'execute code block with non-null values',
      () {
        final String? nullableString = 'Hey there!';
        final length = nullableString?.let((it) => processNonNullString(it));

        expect(length != null, true);
        expect(length, 10);
      },
    );

    test(
      'introduce local variable with limited scope',
      () {
        final newFirstItem = ["one", "one", "two", "three", "four", "five"]
            .first
            .let((it) => it.length < 5 ? '!' : it);

        expect(newFirstItem, '!');
      },
    );
  });

  group('run', () {
    test('execute block of several statements', () {
      final hexNumberRegex = run(() {
        final digits = '0-9';
        final hexDigits = 'a-fA-F';

        return RegExp('[$digits$hexDigits]+');
      });

      final matches = hexNumberRegex
          .allMatches("+123 -FFFF !%*& 88 XYZ")
          .map((RegExpMatch match) => match.group(0));
      expect(matches, ['123', 'FFFF', '88']);
    });
  });

  group('also', () {
    test('perform an action on context object', () {
      final elements = [3, 1, 5];
      elements.also((it) => it.sort()).add(6);

      expect(elements, [1, 3, 5, 6]);
    });
  });
}

int processNonNullString(String input) => input.length;

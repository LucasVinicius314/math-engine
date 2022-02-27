import 'package:math_engine/engine.dart';
import 'package:math_engine/term.dart';
import 'package:test/test.dart';

void main() {
  // test('String.split() splits the string on the delimiter', () {
  //   var string = 'foo,bar,baz';
  //   expect(string.split(','), equals(['foo', 'bar', 'baz']));
  // });

  // test('String.trim() removes surrounding whitespace', () {
  //   var string = '  foo ';
  //   expect(string.trim(), equals('foo'));
  // });

  group('Term', () {
    test('1 returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        sign: Sign.pos,
        value: null,
        coefficient: 1,
      );

      expect(term.toString(), equals('1'));
    });

    test('-1 returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        sign: Sign.neg,
        value: null,
        coefficient: 1,
      );

      expect(term.toString(), equals('-1'));
    });
  });
}

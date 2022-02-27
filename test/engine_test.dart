import 'package:math_engine/engine.dart';
import 'package:math_engine/expression.dart';
import 'package:math_engine/term.dart';
import 'package:test/test.dart';

void main() {
  group('Term', () {
    test('1 returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: null,
        coefficient: 1,
      );

      expect(term.toString(), equals('1'));
    });

    test('-1 returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: null,
        coefficient: -1,
      );

      expect(term.toString(), equals('-1'));
    });

    test('x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        coefficient: 1,
      );

      expect(term.toString(), equals('x'));
    });

    test('2x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      expect(term.toString(), equals('2x'));
    });

    test('-x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        coefficient: -1,
      );

      expect(term.toString(), equals('-x'));
    });

    test('-2x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        coefficient: -2,
      );

      expect(term.toString(), equals('-2x'));
    });
  });

  group('Expression', () {
    test('2 + 2 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: 2,
      );

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('4'));
    });

    test('-2 + 2 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: -2,
      );

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('0'));
    });

    test('3 * 3 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: 3,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('9'));
    });

    test('-3 * -3 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: -3,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: -3,
      );

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('9'));
    });

    test('16 / 4 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: 16,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: 4,
      );

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('4'));
    });

    test('16 / -4 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: 16,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: -4,
      );

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('-4'));
    });
  });
}

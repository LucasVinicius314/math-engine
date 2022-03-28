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

    test('10 returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: null,
        coefficient: 10,
      );

      expect(term.toString(), equals('10'));
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

  group('Expression (2 terms)', () {
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

    test('-16 / 4 returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: null,
        coefficient: -16,
      );

      final b = Term(
        engine,
        value: null,
        coefficient: 4,
      );

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('-4'));
    });

    test('x, x = 10 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 10);

      final a = Term(
        engine,
        value: 'x',
        coefficient: 1,
      );

      final expression = Expression(engine, terms: [a]);

      expect(expression.calculate().toString(), equals('10'));
    });

    test('2x, x = 8 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 8);

      final a = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final expression = Expression(engine, terms: [a]);

      expect(expression.calculate().toString(), equals('16'));
    });

    test('2x * 3y, x = 8, y = 3 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 8);
      engine.addToMap('y', 3);

      final a = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'y',
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('144'));
    });

    test('12x / 3y, x = 2, y = 1 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 2);
      engine.addToMap('y', 1);

      final a = Term(
        engine,
        value: 'x',
        coefficient: 12,
      );

      final b = Term(
        engine,
        value: 'y',
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('8'));
    });

    test('x + x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        coefficient: 1,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 1,
      );

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('2x'));
    });

    test('x - x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        coefficient: 1,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 1,
      );

      final expression = Expression(engine, terms: [a, Operation.sub, b]);

      expect(expression.calculate().toString(), equals('0'));
    });

    test('2x + 3x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('5x'));
    });

    test('7x - 2x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        coefficient: 7,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final expression = Expression(engine, terms: [a, Operation.sub, b]);

      expect(expression.calculate().toString(), equals('5x'));
    });

    test('2x * 3x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('6x²'));
    });
  });

  group('Expression (3 terms)', () {
    test('2 + 2 + 2 returns correctly', () {
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

      final c = Term(
        engine,
        value: null,
        coefficient: 2,
      );

      final expression =
          Expression(engine, terms: [a, Operation.add, b, Operation.add, c]);

      expect(expression.calculate().toString(), equals('6'));
    });
  });

  group('Expression (4 terms)', () {
    test('2 + 2 + 2 + 2 returns correctly', () {
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

      final c = Term(
        engine,
        value: null,
        coefficient: 2,
      );

      final d = Term(
        engine,
        value: null,
        coefficient: 2,
      );

      final expression = Expression(engine,
          terms: [a, Operation.add, b, Operation.add, c, Operation.add, d]);

      expect(expression.calculate().toString(), equals('8'));
    });

    test('2x + 2x + 2x + 2x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final c = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final d = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final expression = Expression(engine,
          terms: [a, Operation.add, b, Operation.add, c, Operation.add, d]);

      expect(expression.calculate().toString(), equals('8x'));
    });

    test('2x + 2x + 2x + 2x, x = 2 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 2);

      final a = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final c = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final d = Term(
        engine,
        value: 'x',
        coefficient: 2,
      );

      final expression = Expression(engine,
          terms: [a, Operation.add, b, Operation.add, c, Operation.add, d]);

      expect(expression.calculate().toString(), equals('16'));
    });
  });
}

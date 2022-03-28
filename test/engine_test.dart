import 'package:math_engine/engine.dart';
import 'package:math_engine/expression.dart';
import 'package:math_engine/term.dart';
import 'package:test/test.dart';

void main() {
  group('Core', () {
    test('Identity', () {
      final engine = Engine();

      final term = Term.identity(engine);

      expect(term.toString(), equals('1'));
    });

    test('Constant 0', () {
      final engine = Engine();

      final term = Term.constant(engine, 0);

      expect(term.toString(), equals('0'));
    });

    test('Constant 1', () {
      final engine = Engine();

      final term = Term.constant(engine, 1);

      expect(term.toString(), equals('1'));
    });

    test('Constant 2', () {
      final engine = Engine();

      final term = Term.constant(engine, 2);

      expect(term.toString(), equals('2'));
    });

    test('Constant 99', () {
      final engine = Engine();

      final term = Term.constant(engine, 99);

      expect(term.toString(), equals('99'));
    });

    test('Constant -0', () {
      final engine = Engine();

      final term = Term.constant(engine, -0);

      expect(term.toString(), equals('0'));
    });

    test('Constant -1', () {
      final engine = Engine();

      final term = Term.constant(engine, -1);

      expect(term.toString(), equals('-1'));
    });

    test('Constant -10', () {
      final engine = Engine();

      final term = Term.constant(engine, -10);

      expect(term.toString(), equals('-10'));
    });

    test('Variable x', () {
      final engine = Engine();

      final term = Term.variable(engine, 'x');

      expect(term.toString(), equals('x'));
    });

    test('Variable y', () {
      final engine = Engine();

      final term = Term.variable(engine, 'y');

      expect(term.toString(), equals('y'));
    });
  });

  group('Term', () {
    test('1 returns correctly', () {
      final engine = Engine();

      final term = Term.constant(engine, 1);

      expect(term.toString(), equals('1'));
    });

    test('10 returns correctly', () {
      final engine = Engine();

      final term = Term.constant(engine, 10);

      expect(term.toString(), equals('10'));
    });

    test('-1 returns correctly', () {
      final engine = Engine();

      final term = Term.constant(engine, -1);

      expect(term.toString(), equals('-1'));
    });

    test('x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 1,
      );

      expect(term.toString(), equals('x'));
    });

    test('2x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      expect(term.toString(), equals('2x'));
    });

    test('-x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: -1,
      );

      expect(term.toString(), equals('-x'));
    });

    test('-2x returns correctly', () {
      final engine = Engine();

      final term = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: -2,
      );

      expect(term.toString(), equals('-2x'));
    });
  });

  group('Expression (2 terms)', () {
    test('2 + 2 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, 2);

      final b = Term.constant(engine, 2);

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('4'));
    });

    test('-2 + 2 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, -2);

      final b = Term.constant(engine, 2);

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('0'));
    });

    test('3 * 3 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, 3);

      final b = Term.constant(engine, 3);

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('9'));
    });

    test('-3 * -3 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, -3);

      final b = Term.constant(engine, -3);

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('9'));
    });

    test('16 / 4 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, 16);

      final b = Term.constant(engine, 4);

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('4'));
    });

    test('16 / -4 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, 16);

      final b = Term.constant(engine, -4);

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('-4'));
    });

    test('-16 / 4 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, -16);

      final b = Term.constant(engine, 4);

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('-4'));
    });

    test('-16 / -4 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, -16);

      final b = Term.constant(engine, -4);

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('4'));
    });

    test('x, x = 10 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 10);

      final a = Term.variable(engine, 'x');

      final expression = Expression(engine, terms: [a]);

      expect(expression.calculate().toString(), equals('10'));
    });

    test('2x, x = 8 returns correctly', () {
      final engine = Engine();

      engine.addToMap('x', 8);

      final a = Term(
        engine,
        value: 'x',
        exponent: null,
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
        exponent: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'y',
        exponent: null,
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
        exponent: null,
        coefficient: 12,
      );

      final b = Term(
        engine,
        value: 'y',
        exponent: null,
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.div, b]);

      expect(expression.calculate().toString(), equals('8'));
    });

    test('x + x returns correctly', () {
      final engine = Engine();

      final a = Term.variable(engine, 'x');

      final b = Term.variable(engine, 'x');

      final expression = Expression(engine, terms: [a, Operation.add, b]);

      expect(expression.calculate().toString(), equals('2x'));
    });

    test('x - x returns correctly', () {
      final engine = Engine();

      final a = Term.variable(engine, 'x');

      final b = Term.variable(engine, 'x');

      final expression = Expression(engine, terms: [a, Operation.sub, b]);

      expect(expression.calculate().toString(), equals('0'));
    });

    test('2x + 3x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        exponent: null,
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
        exponent: null,
        coefficient: 7,
      );

      final b = Term(
        engine,
        value: 'x',
        exponent: null,
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
        exponent: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 3,
      );

      final expression = Expression(engine, terms: [a, Operation.mul, b]);

      expect(expression.calculate().toString(), equals('6x²'));
    });
  });

  group('Expression (3 terms)', () {
    test('2 + 2 + 2 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, 2);

      final b = Term.constant(engine, 2);

      final c = Term.constant(engine, 2);

      final expression =
          Expression(engine, terms: [a, Operation.add, b, Operation.add, c]);

      expect(expression.calculate().toString(), equals('6'));
    });
  });

  group('Expression (4 terms)', () {
    test('2 + 2 + 2 + 2 returns correctly', () {
      final engine = Engine();

      final a = Term.constant(engine, 2);

      final b = Term.constant(engine, 2);

      final c = Term.constant(engine, 2);

      final d = Term.constant(engine, 2);

      final expression = Expression(engine,
          terms: [a, Operation.add, b, Operation.add, c, Operation.add, d]);

      expect(expression.calculate().toString(), equals('8'));
    });

    test('2x + 2x + 2x + 2x returns correctly', () {
      final engine = Engine();

      final a = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final c = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final d = Term(
        engine,
        value: 'x',
        exponent: null,
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
        exponent: null,
        coefficient: 2,
      );

      final b = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final c = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final d = Term(
        engine,
        value: 'x',
        exponent: null,
        coefficient: 2,
      );

      final expression = Expression(engine,
          terms: [a, Operation.add, b, Operation.add, c, Operation.add, d]);

      expect(expression.calculate().toString(), equals('16'));
    });
  });
}

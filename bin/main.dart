import 'engine.dart';
import 'expression.dart';
import 'term.dart';

void main(final List<String> arguments) {
  final engine = Engine();

  final a = Term(
    engine,
    sign: Sign.pos,
    value: null,
    coefficient: 1,
  );

  final b = Term(
    engine,
    sign: Sign.pos,
    value: null,
    coefficient: 2,
  );

  final c = Term(
    engine,
    sign: Sign.pos,
    value: null,
    coefficient: 3,
  );

  final d = Term(
    engine,
    sign: Sign.pos,
    value: null,
    coefficient: 4,
  );

  var exp = Expression(
    engine,
    terms: [
      a,
      Operation.mul,
      b,
      Operation.add,
      c,
      Operation.sub,
      d,
    ],
  );

  print('=== expression');

  print(exp);

  while (true) {
    final newExp = exp.calculate();

    if (exp.toString() == newExp.toString()) {
      break;
    }

    exp = newExp;
  }

  final res = exp.calculate();

  print('=== res');

  print(res);
}

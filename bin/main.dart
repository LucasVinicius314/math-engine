import 'package:math_engine/engine.dart';
import 'package:math_engine/expression.dart';
import 'package:math_engine/term.dart';

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

  final e = Term(
    engine,
    sign: Sign.pos,
    value: 'x',
    coefficient: 1,
  );

  var exp = Expression(
    engine,
    terms: [
      if (false) ...[
        a,
        Operation.mul,
        b,
        Operation.add,
        c,
        Operation.sub,
        d,
      ],
      if (true) ...[
        // a,
        // Operation.mul,
        e,
      ],
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

import 'engine.dart';
import 'term.dart';

void main(final List<String> arguments) {
  final engine = Engine();

  final a = Term(
    engine,
    next: null,
    value: null,
    coefficient: 2,
    operation: null,
  );

  final b = Term(
    engine,
    next: a,
    value: null,
    coefficient: 10,
    operation: Operation.mul,
  );

  final c = Term(
    engine,
    next: b,
    value: null,
    coefficient: 5,
    operation: Operation.mul,
  );

  // final a = Term(
  //   engine,
  //   next: null,
  //   value: null,
  //   coefficient: 13,
  //   operation: null,
  // );

  // final b = Term(
  //   engine,
  //   next: a,
  //   value: null,
  //   coefficient: 10,
  //   operation: Operation.sub,
  // );

  // final c = Term(
  //   engine,
  //   next: b,
  //   value: null,
  //   coefficient: 5,
  //   operation: Operation.mul,
  // );

  print(c.toString());

  final res = c.calculate();

  print(res);
}

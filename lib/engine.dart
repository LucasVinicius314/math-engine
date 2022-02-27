import 'package:math_engine/term.dart';

class Engine {
  final valueMap = <String, dynamic>{};

  Engine();

  dynamic resolveValue(String? value) {
    return valueMap[value];
  }

  void addToMap(String key, dynamic value) {
    valueMap[key] = value;
  }

  Term compute(Term a, Operation operation, Term b) {
    switch (operation) {
      case Operation.add:
        return Term(
          this,
          sign: Sign.pos,
          value: null,
          coefficient: a.coefficient + b.coefficient,
        );
      case Operation.sub:
        return Term(
          this,
          sign: Sign.pos,
          value: null,
          coefficient: a.coefficient - b.coefficient,
        );
      case Operation.mul:
        return Term(
          this,
          sign: Sign.pos,
          value: null,
          coefficient: a.coefficient * b.coefficient,
        );
      case Operation.div:
        return Term(
          this,
          sign: Sign.pos,
          value: null,
          coefficient: a.coefficient / b.coefficient,
        );
    }
  }
}

enum Operation { add, sub, mul, div }

enum Sign { pos, neg }

const operationToString = <Operation, String>{
  Operation.add: '+',
  Operation.sub: '-',
  Operation.mul: '*',
  Operation.div: '/',
};

const signToString = <Sign, String>{
  Sign.pos: '',
  Sign.neg: '-',
};

const operationPrecedence = <Operation, int>{
  Operation.add: 0,
  Operation.sub: 0,
  Operation.mul: 1,
  Operation.div: 1,
};

int precedenceDiff(Operation a, Operation b) {
  return operationPrecedence[a]! - operationPrecedence[b]!;
}

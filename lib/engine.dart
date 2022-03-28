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
    final newA = a.calculate();
    final newB = b.calculate();

    switch (operation) {
      case Operation.add:
        if (newA.value == newB.value) {
          return Term(
            this,
            value: newA.value,
            coefficient: newA.coefficient + newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
      case Operation.sub:
        if (newA.value == newB.value) {
          return Term(
            this,
            value: newA.value,
            coefficient: newA.coefficient - newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
      case Operation.mul:
        if (newA.value == null && newB.value == null) {
          return Term(
            this,
            value: null,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (newA.value == newB.value) {
          return Term(
            this,
            value: '${newA.value}²',
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (newA.value != null && newB.value != null) {
          return Term(
            this,
            value: '${newA.value}${newB.value}',
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (newA.value == null && newB.value != null) {
          return Term(
            this,
            value: newB.value,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (newA.value != null && newB.value == null) {
          return Term(
            this,
            value: newA.value,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
      case Operation.div:
        if (newA.value == null && newB.value == null) {
          return Term(
            this,
            value: null,
            coefficient: newA.coefficient / newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
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

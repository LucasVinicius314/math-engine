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

    final bothExponentsEqual = newA.exponent == newB.exponent;

    final bothValuesEqual = newA.value == newB.value;
    final bothValuesNull = newA.value == null && newB.value == null;
    final bothValuesNotNull = newA.value != null && newB.value != null;
    final aNullBNotNullValues = newA.value == null && newB.value != null;
    final aNotNullBNullValues = newA.value != null && newB.value == null;

    switch (operation) {
      case Operation.add:
        if (bothValuesEqual && bothExponentsEqual) {
          return Term(
            this,
            value: newA.value,
            exponent: newA.exponent,
            coefficient: newA.coefficient + newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
      case Operation.sub:
        if (bothValuesEqual && bothExponentsEqual) {
          return Term(
            this,
            value: newA.value,
            exponent: newA.exponent,
            coefficient: newA.coefficient - newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
      case Operation.mul:
        if (bothValuesNull && bothExponentsEqual) {
          return Term(
            this,
            value: null,
            exponent: newA.exponent,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (bothValuesEqual && bothExponentsEqual) {
          return Term(
            this,
            // TODO: fix, calculate new expression on exponent
            value: '${newA.value}²',
            exponent: newA.exponent,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (bothValuesNotNull && bothExponentsEqual) {
          return Term(
            this,
            value: '${newA.value}${newB.value}',
            exponent: newA.exponent,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (aNullBNotNullValues && bothExponentsEqual) {
          return Term(
            this,
            value: newB.value,
            exponent: newA.exponent,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        if (aNotNullBNullValues && bothExponentsEqual) {
          return Term(
            this,
            value: newA.value,
            exponent: newA.exponent,
            coefficient: newA.coefficient * newB.coefficient,
          );
        }

        throw Exception('Not implemented.');
      case Operation.div:
        if (bothValuesNull && bothExponentsEqual) {
          return Term(
            this,
            value: null,
            exponent: newA.exponent,
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

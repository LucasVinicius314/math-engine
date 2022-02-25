import 'engine.dart';

class Term {
  final double coefficient;
  final String? value;
  final Engine engine;
  final Term? next;
  final Operation? operation;

  Term(
    this.engine, {
    required this.next,
    required this.value,
    required this.operation,
    required this.coefficient,
  }) : assert(
          (next == null && operation == null) ||
              (next != null && operation != null),
        );

  dynamic calculate([bool blockNext = false]) {
    print('calculating $coefficient');

    final localValue = value;
    final localNext = next;
    final localOperation = operation;

    if (blockNext) {
      return coefficient;
    }

    if (localNext != null) {
      final nextOperation = localNext.operation;

      if (nextOperation != null) {
        if (precedenceDiff(localOperation!, nextOperation) >= 0) {
          final res = coefficient *
              localNext.calculate(true) *
              localNext.next?.calculate();

          return res;
        }
      }
    }

    if (localValue == null) {
      // has a value

      if (localNext != null) {
        // has a next value

        // if (operationPrecedence[localOperation]! >
        //     operationPrecedence[localNext.operation]!) {
        //       // TODO: fix, precedence
        //   ''.toLowerCase();
        // }

        return compute(localOperation: localOperation!, next: localNext);
      }

      return coefficient;
    } else {
      final engineValue = engine.resolveValue(localValue);

      if (engineValue is num) {
        return coefficient * engineValue;
      } else if (engineValue == null) {
        if (coefficient == 1) {
          return localValue;
        } else {
          return '$coefficient$localValue';
        }
      } else {
        return '$coefficient$engineValue';
      }
    }
  }

  dynamic compute({
    required Operation localOperation,
    required Term next,
  }) {
    final calculatedNext = next.calculate();

    if (calculatedNext is num) {
      return {
        Operation.add: coefficient + calculatedNext,
        Operation.sub: coefficient - calculatedNext,
        Operation.mul: coefficient * calculatedNext,
        Operation.div: coefficient / calculatedNext,
      }[localOperation];
    } else {
      return {
        Operation.add: '$coefficient + $calculatedNext',
        Operation.sub: '$coefficient - $calculatedNext',
        Operation.mul: '$coefficient * $calculatedNext',
        Operation.div: '$coefficient / $calculatedNext',
      }[localOperation];
    }
  }

  @override
  String toString() {
    final localValue = value ?? '';
    final localNext = next;
    final localOperation = operation;

    if (localNext == null) {
      return '$coefficient$localValue';
    } else {
      return '$coefficient$localValue ${operationToString[localOperation]} $localNext';
    }
  }
}

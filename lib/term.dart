import 'package:math_engine/expression.dart';

import 'engine.dart';

class Term {
  final Engine engine;

  final String? value;
  final Expression? exponent;
  final double coefficient;

  Term(
    this.engine, {
    required this.value,
    required this.exponent,
    required this.coefficient,
  });

  Term.identity(this.engine)
      : value = null,
        exponent = null,
        coefficient = 1;

  Term.constant(this.engine, this.coefficient)
      : value = null,
        exponent = null;

  Term.variable(this.engine, this.value)
      : exponent = null,
        coefficient = 1;

  Sign get sign =>
      coefficient.sign == -1 || coefficient.sign == -0 ? Sign.neg : Sign.pos;

  Term calculate() {
    print('calculating $this');

    final localValue = value;
    final localExponent = exponent;
    final localCoefficient = coefficient;

    final calculatedExponent = localExponent?.calculate();

    final engineValue = engine.resolveValue(localValue);

    if (engineValue is num) {
      final out = Term(
        engine,
        value: null,
        exponent: calculatedExponent,
        coefficient: localCoefficient * engineValue,
      );

      return out;
    } else if (engineValue is String) {
      final out = Term(
        engine,
        value: engineValue,
        exponent: calculatedExponent,
        coefficient: localCoefficient,
      );

      return out;
    }

    final out = Term(
      engine,
      value: value,
      exponent: calculatedExponent,
      coefficient: coefficient,
    );

    return out;
  }

  @override
  String toString() {
    final localExponent = exponent;
    final localValue = value ?? '';
    final localCoefficient =
        (localValue != '' && (coefficient == 1 || coefficient == -1)
                ? ''
                : coefficient.toString().replaceFirst(RegExp(r'.0+$'), ''))
            .replaceFirst(RegExp(r'^-'), '');

    final newSign = coefficient == 0 ? '' : signToString[sign];

    if (localCoefficient == '0') {
      return localCoefficient;
    }

    if (localExponent == null) {
      return '$newSign$localCoefficient$localValue';
    }

    return '$newSign$localCoefficient$localValue^($localExponent)';
  }
}

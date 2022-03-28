import 'engine.dart';

class Term {
  final Engine engine;

  final String? value;
  final double coefficient;

  Term(
    this.engine, {
    required this.value,
    required this.coefficient,
  });

  Sign get sign =>
      coefficient.sign == -1 || coefficient.sign == -0 ? Sign.neg : Sign.pos;

  Term calculate() {
    print('calculating $this');

    final localValue = value;
    final localCoefficient = coefficient;

    final engineValue = engine.resolveValue(localValue);

    if (engineValue is num) {
      final out = Term(
        engine,
        value: null,
        coefficient: localCoefficient * engineValue,
      );

      return out;
    } else if (engineValue is String) {
      final out = Term(
        engine,
        value: engineValue,
        coefficient: localCoefficient,
      );

      return out;
    }

    return this;
  }

  @override
  String toString() {
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

    return '$newSign$localCoefficient$localValue';
  }
}

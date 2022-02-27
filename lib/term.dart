import 'engine.dart';

class Term {
  final Engine engine;

  final Sign sign;
  final String? value;
  final double coefficient;

  Term(
    this.engine, {
    required this.sign,
    required this.value,
    required this.coefficient,
  });

  Term calculate() {
    print('calculating $this');

    final localValue = value;
    final localCoefficient = coefficient;

    final engineValue = engine.resolveValue(localValue);

    if (engineValue is num) {
      final out = Term(
        engine,
        sign: sign,
        value: null,
        coefficient: localCoefficient * engineValue,
      );

      return out;
    } else if (engineValue is String) {
      final out = Term(
        engine,
        sign: sign,
        value: engineValue,
        coefficient: localCoefficient,
      );

      return out;
    }

    return this;
  }

  @override
  String toString() {
    final localSign = sign;
    final localValue = value ?? '';
    final localCoefficient =
        coefficient.toString().replaceFirst(RegExp(r'.0+$'), '');

    final newSign = signToString[localSign];

    return '$newSign$localCoefficient$localValue';
  }
}

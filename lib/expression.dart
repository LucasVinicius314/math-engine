import 'package:math_engine/term.dart';

import 'engine.dart';

class Expression {
  final Engine engine;

  final List<dynamic> terms;

  Expression(
    this.engine, {
    required this.terms,
  }) : assert(
          terms.every((element) => element is Term || element is Operation),
          terms.length.isEven,
        );

  Expression calculate() {
    if (terms.length == 1) {
      final calculatedTerm = (terms.first as Term).calculate();

      return Expression(engine, terms: [calculatedTerm]);
    }

    final newTerms = [];

    final operations = terms.whereType<Operation>();

    List<Operation>.from(operations).asMap().forEach((key, value) {
      final baseKey = key * 2;

      if (key.isEven) {
        if (baseKey > terms.length) {
          return;
        }

        final a = terms[baseKey];
        final b = terms[baseKey + 2];
        final calculatedTerm = engine.compute(a, value, b);

        newTerms.add(calculatedTerm);
      } else {
        newTerms.add(value);

        if (baseKey == terms.length - 1) {
          final nextTerm = terms[baseKey];

          newTerms.add(nextTerm);
        }
      }
    });

    return Expression(engine, terms: newTerms);
  }

  @override
  String toString() {
    return terms.map((e) {
      if (e is Term) {
        return e.toString();
      } else if (e is Operation) {
        return operationToString[e];
      } else {
        return null;
      }
    }).join(' ');
  }
}

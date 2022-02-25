class Engine {
  final valueMap = <String, dynamic>{};

  Engine();

  dynamic resolveValue(String value) {
    return valueMap[value];
  }

  void addToMap(String key, dynamic value) {
    valueMap[key] = value;
  }
}

enum Operation { add, sub, mul, div }

const operationToString = <Operation, String>{
  Operation.add: '+',
  Operation.sub: '-',
  Operation.mul: '*',
  Operation.div: '/',
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

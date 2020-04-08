import 'package:missing_kotlin/src/standard.dart';

///
/// .kt
///
/// when(expression) {
/// 	case 0 => value1
/// 	case 1 => value2
/// 	default => value3
/// }
///
/// .dart
///
/// when(expression, [
/// 	Case(0, () => value1),
/// 	Case(1, () => value2),
/// 	Default(() => value3)
/// ])

typedef R WhenBlock<R>();

@Nullable()
R when<T, R>(T value, List<WhenStatement<T, R>> statements) {
  Default<T, R> defaultStatement;
  for (var statement in statements) {
    if (statement is Default) {
      if (defaultStatement != null) {
        print("already has a default statement");
      }
      defaultStatement = statement;
    } else if (statement.satisfy(value)) {
      return statement.invoke();
    }
  }
  //if here, no return happened, call the de defaultStatement if found
  if (defaultStatement != null) {
    return defaultStatement.invoke();
  }

  return null;
}

abstract class WhenStatement<T, R> {
  final WhenBlock block;
  const WhenStatement(this.block);
  bool satisfy(T value);
  R invoke() {
    return block();
  }
}

class Case<T, R> extends WhenStatement<T, R> {
  final value;

  const Case(this.value, WhenBlock<R> block) : super(block);

  @override
  bool satisfy(T value) {
    return this.value == value;
  }
}

class Is<T, R> extends WhenStatement<T, R> {
  final Type type;

  const Is(this.type, WhenBlock<R> block) : super(block);

  @override
  bool satisfy(T value) {
    return value.runtimeType == type;
  }
}

class Default<T, R> extends WhenStatement<T, R> {
  const Default(WhenBlock<R> block) : super(block);

  @override
  bool satisfy(T value) {
    return true;
  }
}

# missing_kotlin

"Flutter is **** because it does not use Kotlin" Already heard it ?
Prove them you can do the same thing as Kotlin using Flutter/Dart !

## .let

Work like `.let` in kotlin

```dart
final calculated = myMethod()?.let((v){
  return v*2;
}) ?? 0;
```

Will also break th chain if th expression is null

```dart
String variable; //null
final calculated = variable?.let((v) => v.length());

//here the expression is null, it will not execute the lambda
expect(calculated, null);
```

## .also

Work like `.also` in kotlin

```dart
final result = myMethod()?.also((v){
  print(v);
});
```

`result` here is the return value of `myMethod()`

## .run

Work like `.run` in kotlin

```dart
final calculated = myMethod()?.let((v){
  return v*2;
}) ?? run(() => 3);
```

## .takeIf

Work like `.takeIf` in kotlin

```dart
final calculated = myMethod()?.takeIf((v) => v == 3)?.let((v){
  return v*2;
}) ?? 0;
```

## When

```dart
final variable = 3;
final result = when(variable, [
    Case(2, () => "A"),
    Case(3, () => "B"),
    Default(() => "C"),
]);

//here the result is "B"
expect(calculated, null);
```

## If

Like a Kotlin if, returning a value, but with an Uppercase (because if is a reserved word)

```dart
final result = If(1 == 2, 
  () => "A", 
  Else: () => "B"
);

//here the result is "B"
expect(result, "1");
```

You can also chain statements

```dart
final variable2 = 1;
final result = If(variable2 == 2,
    () => "A",
  Else: () => 
    If(variable2 == 3,
        () => "B",
    Else: 
        () => "C"
  ),
);

//here the result is "C"
expect(result, "C");
```
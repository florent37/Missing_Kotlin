import 'package:flutter_test/flutter_test.dart';
import 'package:missing_kotlin/missing_kotlin.dart';

void main() {
  test('when', () {
    expect(
        when(2, [
          Case(2, () => "A"),
          Case(3, () => "B"),
          Default(() => "C"),
        ]),
        "A");

    int value1 = 4 - 1;
    expect(
        when(value1, [
          Case(2, () => "A"),
          Case(3, () => "B"),
          Default(() => "C"),
        ]),
        "B");

    int value2 = 4 + 1;
    expect(
        when(value2, [
          Case(2, () => "A"),
          Case(3, () => "B"),
          Default(() => "C"),
        ]),
        "C");

    expect(
        when(6, [
          Default(() => "C"),
          Case(2, () => "A"),
          Case(3, () => "B"),
        ]),
        "C");
  });

  test('if', () {
    expect(If(1 == 1, () => "A"), "A");

    expect(If(1 == 1, () => "A", Else: () => "A"), "A");

    expect(If(1 == 2, () => "A", Else: () => "B"), "B");

    final variable = 1;
    expect(
        If(
          variable == 2,
          () => "A",
          Else: () => If(
            variable == 1,
            () => "B",
          ),
        ),
        "B");

    final variable2 = 1;
    expect(
        If(
          variable2 == 2,
              () => "A",
          Else: () => If(
              variable2 == 3,
                () => "B",
            Else: () => "C"
          ),
        ),
        "C");
  });

  test('let', () {
    //region when null
    String variableNull;

    final int valueWhenNull1 = variableNull?.let((s) => 1);
    expect(valueWhenNull1, null);

    final int valueWhenNull2 = variableNull?.let((s) => 1) ?? 0;
    expect(valueWhenNull2, 0);
    //endregion

    //region when not null
    final String variableNN = "nn";

    final int valueWhenNN1 = variableNN?.let((s) => 1);
    expect(valueWhenNN1, 1);

    final int valueWhenNN2 = variableNN?.let((s) => 1) ?? 0;
    expect(valueWhenNN2, 1);
    //endrgion

    //region chain
    expect(1?.let((v) => v + 1)?.let((v) => v.toString()), "2");
    //endregion
  });

  test('takeIf', () {
    //region success
    int variableSuccess = 1;

    final int valueResultSuccess = variableSuccess?.takeIf((v) => v == 1)?.let((v) => v+1);
    expect(valueResultSuccess, 2);
    //endregion

    //region failure
    int variableFailure = 0;

    final int valueResultFailure = variableFailure?.takeIf((v) => v == 1)?.let((v) => v+1);
    expect(valueResultFailure, null);
    //endregion
  });

  test('also', () {
    //region when null
    String variableNull;
    String testVarNull;

    final String returnValueNull = variableNull?.also((s) {
      testVarNull = "3";
    });
    expect(returnValueNull, variableNull);
    expect(testVarNull, null);
    //endregion

    //region when not null
    String variableNN = "value";
    String testVarNN;

    final String returnValue1 = variableNN?.also((s) {
      testVarNN = "3";
    });
    expect(returnValue1, variableNN);
    expect(testVarNN, "3");
    //endregion
  });

  test('run', () {
    //region when null
    final String returnValueNull = run(() => "3");
    expect(returnValueNull, "3");
    //endregion
  });
}

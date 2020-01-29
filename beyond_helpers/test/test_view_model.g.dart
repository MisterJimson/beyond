// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestViewModel on _TestViewModel, Store {
  Computed<String> _$testComputedComputed;

  @override
  String get testComputed =>
      (_$testComputedComputed ??= Computed<String>(() => super.testComputed))
          .value;

  final _$testStringAtom = Atom(name: '_TestViewModel.testString');

  @override
  String get testString {
    _$testStringAtom.context.enforceReadPolicy(_$testStringAtom);
    _$testStringAtom.reportObserved();
    return super.testString;
  }

  @override
  set testString(String value) {
    _$testStringAtom.context.conditionallyRunInAction(() {
      super.testString = value;
      _$testStringAtom.reportChanged();
    }, _$testStringAtom, name: '${_$testStringAtom.name}_set');
  }

  final _$testIntAtom = Atom(name: '_TestViewModel.testInt');

  @override
  int get testInt {
    _$testIntAtom.context.enforceReadPolicy(_$testIntAtom);
    _$testIntAtom.reportObserved();
    return super.testInt;
  }

  @override
  set testInt(int value) {
    _$testIntAtom.context.conditionallyRunInAction(() {
      super.testInt = value;
      _$testIntAtom.reportChanged();
    }, _$testIntAtom, name: '${_$testIntAtom.name}_set');
  }

  final _$_TestViewModelActionController =
      ActionController(name: '_TestViewModel');

  @override
  void testAction() {
    final _$actionInfo = _$_TestViewModelActionController.startAction();
    try {
      return super.testAction();
    } finally {
      _$_TestViewModelActionController.endAction(_$actionInfo);
    }
  }
}

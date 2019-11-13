// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  final _$placeDescAtom = Atom(name: '_HomeViewModel.placeDesc');

  @override
  String get placeDesc {
    _$placeDescAtom.context.enforceReadPolicy(_$placeDescAtom);
    _$placeDescAtom.reportObserved();
    return super.placeDesc;
  }

  @override
  set placeDesc(String value) {
    _$placeDescAtom.context.conditionallyRunInAction(() {
      super.placeDesc = value;
      _$placeDescAtom.reportChanged();
    }, _$placeDescAtom, name: '${_$placeDescAtom.name}_set');
  }

  final _$pointsOfInterestAtom = Atom(name: '_HomeViewModel.pointsOfInterest');

  @override
  List<Park> get pointsOfInterest {
    _$pointsOfInterestAtom.context.enforceReadPolicy(_$pointsOfInterestAtom);
    _$pointsOfInterestAtom.reportObserved();
    return super.pointsOfInterest;
  }

  @override
  set pointsOfInterest(List<Park> value) {
    _$pointsOfInterestAtom.context.conditionallyRunInAction(() {
      super.pointsOfInterest = value;
      _$pointsOfInterestAtom.reportChanged();
    }, _$pointsOfInterestAtom, name: '${_$pointsOfInterestAtom.name}_set');
  }

  final _$getLocationAsyncAction = AsyncAction('getLocation');

  @override
  Future getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }
}

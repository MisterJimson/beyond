// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  Computed<String> _$placeDescComputed;

  @override
  String get placeDesc =>
      (_$placeDescComputed ??= Computed<String>(() => super.placeDesc)).value;

  final _$currentPlaceAtom = Atom(name: '_HomeViewModel.currentPlace');

  @override
  Place get currentPlace {
    _$currentPlaceAtom.context.enforceReadPolicy(_$currentPlaceAtom);
    _$currentPlaceAtom.reportObserved();
    return super.currentPlace;
  }

  @override
  set currentPlace(Place value) {
    _$currentPlaceAtom.context.conditionallyRunInAction(() {
      super.currentPlace = value;
      _$currentPlaceAtom.reportChanged();
    }, _$currentPlaceAtom, name: '${_$currentPlaceAtom.name}_set');
  }

  final _$pointsOfInterestAtom = Atom(name: '_HomeViewModel.pointsOfInterest');

  @override
  List<PointOfInterest> get pointsOfInterest {
    _$pointsOfInterestAtom.context.enforceReadPolicy(_$pointsOfInterestAtom);
    _$pointsOfInterestAtom.reportObserved();
    return super.pointsOfInterest;
  }

  @override
  set pointsOfInterest(List<PointOfInterest> value) {
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

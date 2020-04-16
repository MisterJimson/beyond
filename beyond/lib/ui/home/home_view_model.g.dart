// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  final _$currentLocationAtom = Atom(name: '_HomeViewModel.currentLocation');

  @override
  String get currentLocation {
    _$currentLocationAtom.context.enforceReadPolicy(_$currentLocationAtom);
    _$currentLocationAtom.reportObserved();
    return super.currentLocation;
  }

  @override
  set currentLocation(String value) {
    _$currentLocationAtom.context.conditionallyRunInAction(() {
      super.currentLocation = value;
      _$currentLocationAtom.reportChanged();
    }, _$currentLocationAtom, name: '${_$currentLocationAtom.name}_set');
  }

  final _$isCurrentLocationLoadingAtom =
      Atom(name: '_HomeViewModel.isCurrentLocationLoading');

  @override
  bool get isCurrentLocationLoading {
    _$isCurrentLocationLoadingAtom.context
        .enforceReadPolicy(_$isCurrentLocationLoadingAtom);
    _$isCurrentLocationLoadingAtom.reportObserved();
    return super.isCurrentLocationLoading;
  }

  @override
  set isCurrentLocationLoading(bool value) {
    _$isCurrentLocationLoadingAtom.context.conditionallyRunInAction(() {
      super.isCurrentLocationLoading = value;
      _$isCurrentLocationLoadingAtom.reportChanged();
    }, _$isCurrentLocationLoadingAtom,
        name: '${_$isCurrentLocationLoadingAtom.name}_set');
  }

  final _$nearbyParksAtom = Atom(name: '_HomeViewModel.nearbyParks');

  @override
  List<ParkListItem> get nearbyParks {
    _$nearbyParksAtom.context.enforceReadPolicy(_$nearbyParksAtom);
    _$nearbyParksAtom.reportObserved();
    return super.nearbyParks;
  }

  @override
  set nearbyParks(List<ParkListItem> value) {
    _$nearbyParksAtom.context.conditionallyRunInAction(() {
      super.nearbyParks = value;
      _$nearbyParksAtom.reportChanged();
    }, _$nearbyParksAtom, name: '${_$nearbyParksAtom.name}_set');
  }

  final _$isNearbyParksLoadingAtom =
      Atom(name: '_HomeViewModel.isNearbyParksLoading');

  @override
  bool get isNearbyParksLoading {
    _$isNearbyParksLoadingAtom.context
        .enforceReadPolicy(_$isNearbyParksLoadingAtom);
    _$isNearbyParksLoadingAtom.reportObserved();
    return super.isNearbyParksLoading;
  }

  @override
  set isNearbyParksLoading(bool value) {
    _$isNearbyParksLoadingAtom.context.conditionallyRunInAction(() {
      super.isNearbyParksLoading = value;
      _$isNearbyParksLoadingAtom.reportChanged();
    }, _$isNearbyParksLoadingAtom,
        name: '${_$isNearbyParksLoadingAtom.name}_set');
  }

  final _$_getLocationDataAsyncAction = AsyncAction('_getLocationData');

  @override
  Future<dynamic> _getLocationData() {
    return _$_getLocationDataAsyncAction.run(() => super._getLocationData());
  }

  final _$_getCurrentLocationAsyncAction = AsyncAction('_getCurrentLocation');

  @override
  Future<dynamic> _getCurrentLocation(Position position) {
    return _$_getCurrentLocationAsyncAction
        .run(() => super._getCurrentLocation(position));
  }

  final _$_getNearbyParksAsyncAction = AsyncAction('_getNearbyParks');

  @override
  Future<dynamic> _getNearbyParks(Position position) {
    return _$_getNearbyParksAsyncAction
        .run(() => super._getNearbyParks(position));
  }

  @override
  String toString() {
    final string =
        'currentLocation: ${currentLocation.toString()},isCurrentLocationLoading: ${isCurrentLocationLoading.toString()},nearbyParks: ${nearbyParks.toString()},isNearbyParksLoading: ${isNearbyParksLoading.toString()}';
    return '{$string}';
  }
}

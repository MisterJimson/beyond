// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  final _$currentLocationAtom = Atom(name: '_HomeViewModel.currentLocation');

  @override
  String get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(String value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  final _$isCurrentLocationLoadingAtom =
      Atom(name: '_HomeViewModel.isCurrentLocationLoading');

  @override
  bool get isCurrentLocationLoading {
    _$isCurrentLocationLoadingAtom.reportRead();
    return super.isCurrentLocationLoading;
  }

  @override
  set isCurrentLocationLoading(bool value) {
    _$isCurrentLocationLoadingAtom
        .reportWrite(value, super.isCurrentLocationLoading, () {
      super.isCurrentLocationLoading = value;
    });
  }

  final _$nearbyParksAtom = Atom(name: '_HomeViewModel.nearbyParks');

  @override
  List<ParkListItem> get nearbyParks {
    _$nearbyParksAtom.reportRead();
    return super.nearbyParks;
  }

  @override
  set nearbyParks(List<ParkListItem> value) {
    _$nearbyParksAtom.reportWrite(value, super.nearbyParks, () {
      super.nearbyParks = value;
    });
  }

  final _$isNearbyParksLoadingAtom =
      Atom(name: '_HomeViewModel.isNearbyParksLoading');

  @override
  bool get isNearbyParksLoading {
    _$isNearbyParksLoadingAtom.reportRead();
    return super.isNearbyParksLoading;
  }

  @override
  set isNearbyParksLoading(bool value) {
    _$isNearbyParksLoadingAtom.reportWrite(value, super.isNearbyParksLoading,
        () {
      super.isNearbyParksLoading = value;
    });
  }

  final _$_getLocationDataAsyncAction =
      AsyncAction('_HomeViewModel._getLocationData');

  @override
  Future<dynamic> _getLocationData() {
    return _$_getLocationDataAsyncAction.run(() => super._getLocationData());
  }

  final _$_getCurrentLocationAsyncAction =
      AsyncAction('_HomeViewModel._getCurrentLocation');

  @override
  Future<dynamic> _getCurrentLocation(Position position) {
    return _$_getCurrentLocationAsyncAction
        .run(() => super._getCurrentLocation(position));
  }

  final _$_getNearbyParksAsyncAction =
      AsyncAction('_HomeViewModel._getNearbyParks');

  @override
  Future<dynamic> _getNearbyParks(Position position) {
    return _$_getNearbyParksAsyncAction
        .run(() => super._getNearbyParks(position));
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation},
isCurrentLocationLoading: ${isCurrentLocationLoading},
nearbyParks: ${nearbyParks},
isNearbyParksLoading: ${isNearbyParksLoading}
    ''';
  }
}

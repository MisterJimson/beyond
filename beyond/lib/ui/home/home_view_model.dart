import 'package:beyond/domain/manager/auth_manager.dart';
import 'package:beyond/domain/models.dart';
import 'package:beyond/service/location_service.dart';
import 'package:beyond/ui/navigation_manager.dart';
import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:beyond/service/api_service.dart';
import 'package:pedantic/pedantic.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel extends ViewModel with Store {
  final AuthManager _authManager;
  final ApiService _apiService;
  final LocationService _locationService;
  final NavigationManager _navigationManager;

  @observable
  String currentLocation = '';

  @observable
  bool isCurrentLocationLoading = true;

  @observable
  List<ParkListItem> nearbyParks = [];

  @observable
  bool isNearbyParksLoading = true;

  _HomeViewModel(this._authManager, this._apiService, this._locationService,
      this._navigationManager) {
    _getLocationData();
  }

  Future viewPark(ParkListItem parkListItem) {
    return _navigationManager.goToParkDetail(parkListItem.park);
  }

  @action
  Future _getLocationData() async {
    var position = await _locationService.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    unawaited(_getCurrentLocation(position));
    unawaited(_getNearbyParks(position));
  }

  @action
  Future _getCurrentLocation(Position position) async {
    isCurrentLocationLoading = true;
    var getPlaceResponse =
        await _apiService.getPlace(position.longitude, position.latitude);
    var data = getPlaceResponse.data;
    if (getPlaceResponse.isSuccess && data != null) {
      currentLocation = '${data.address.houseNumber} ${data.address.road}';
    }
    isCurrentLocationLoading = false;
  }

  @action
  Future _getNearbyParks(Position position) async {
    isNearbyParksLoading = true;
    var getPointsOfInterestResponse = await _apiService.getPointsOfInterest(
        position.longitude, position.latitude, 'park');
    var data = getPointsOfInterestResponse.data;
    if (getPointsOfInterestResponse.isSuccess && data != null) {
      nearbyParks = data
          .map((x) => ParkListItem(
              Park(name: x.name, distance: x.distance, lat: x.lat, lon: x.lon)))
          .toList();
    }
    isNearbyParksLoading = false;
  }

  void logout() {
    _authManager.logout();
  }
}

class ParkListItem {
  Park park;

  ParkListItem(this.park);

  String get nameAndDistance => '${park.name} is ${park.distance} meters away';
}

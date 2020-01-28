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
  String currentLocation = "";

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

    if (position != null &&
        position.latitude != null &&
        position.longitude != null) {
      unawaited(_getCurrentLocation(position));
      unawaited(_getNearbyParks(position));
    } else {
      isCurrentLocationLoading = false;
      isNearbyParksLoading = false;
    }
  }

  @action
  Future _getCurrentLocation(Position position) async {
    isCurrentLocationLoading = true;
    var x = await _apiService.getPlace(position.longitude, position.latitude);
    if (x.isSuccess) {
      currentLocation =
          "${x.data.address.houseNumber ?? ""} ${x.data.address.road}";
    }
    isCurrentLocationLoading = false;
  }

  @action
  Future _getNearbyParks(Position position) async {
    isNearbyParksLoading = true;
    var x = await _apiService.getPointsOfInterest(
        position.longitude, position.latitude, "park");
    if (x.isSuccess) {
      nearbyParks = x.data
          .where((x) => x.name != null)
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

  String get nameAndDistance => "${park.name} is ${park.distance} meters away";
}

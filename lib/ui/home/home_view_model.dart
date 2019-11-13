import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:beyond/manager/auth_manager.dart';
import 'package:beyond/service/api_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final AuthManager _authManager;
  final ApiService _apiService;

  @observable
  String currentLocation = "";

  @observable
  bool isCurrentLocationLoading = true;

  @observable
  List<Park> nearbyParks = [];

  @observable
  bool isPointsOfInterestLoading = true;

  _HomeViewModel(this._authManager, this._apiService) {
    getLocationData();
  }

  Future getLocationData() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    _getCurrentLocation(position);
    _getNearbyParks(position);
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
    isPointsOfInterestLoading = true;
    var x = await _apiService.getPointsOfInterest(
        position.longitude, position.latitude, "park");
    if (x.isSuccess) {
      nearbyParks = x.data
          .where((x) => x.name != null)
          .map((x) => Park("${x.name} is ${x.distance} meters away"))
          .toList();
    }
    isPointsOfInterestLoading = false;
  }

  void logout() {
    _authManager.logout();
  }
}

class Park {
  String nameAndDistance;

  Park(this.nameAndDistance);
}

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
  Place currentPlace;

  @computed
  String get placeDesc =>
      "${currentPlace.address.houseNumber ?? ""} ${currentPlace.address.road}";

  @observable
  List<PointOfInterest> pointsOfInterest = [];

  _HomeViewModel(this._authManager, this._apiService) {
    getLocation();
  }

  @action
  Future getLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    _apiService.getPlace(position.longitude, position.latitude).then((x) {
      currentPlace = x.data;
    });

    _apiService
        .getPointsOfInterest(position.longitude, position.latitude, "park")
        .then((x) {
      if (x.isSuccess) {
        pointsOfInterest = x.data.where((x) => x.name != null).toList();
      }
    });
  }

  void logout() {
    _authManager.logout();
  }
}

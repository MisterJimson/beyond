import 'package:geolocator/geolocator.dart';

class LocationService {
  final Geolocator _geolocator = Geolocator();

  Future<Position> getCurrentPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {
    return _geolocator.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }
}

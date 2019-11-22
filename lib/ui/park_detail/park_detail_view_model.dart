import 'package:beyond/domain/models.dart';
import 'package:beyond/service/api_service.dart';
import 'package:mobx/mobx.dart';

part 'park_detail_view_model.g.dart';

class ParkDetailViewModel = _ParkDetailViewModel with _$ParkDetailViewModel;

abstract class _ParkDetailViewModel with Store {
  final ApiService _apiService;
  final Park _park;

  String get parkName => _park.name;

  String get distanceFrom => "You are ${_park.distance} meters away";

  String parkImageUrl;

  _ParkDetailViewModel(this._park, this._apiService) {
    parkImageUrl = _apiService.getStaticMapImageUrl(_park.lon, _park.lat);
  }
}

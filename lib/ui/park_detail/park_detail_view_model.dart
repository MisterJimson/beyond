import 'package:beyond/domain/models.dart';
import 'package:mobx/mobx.dart';

part 'park_detail_view_model.g.dart';

class ParkDetailViewModel = _ParkDetailViewModel with _$ParkDetailViewModel;

abstract class _ParkDetailViewModel with Store {
  final Park park;

  _ParkDetailViewModel(this.park);
}

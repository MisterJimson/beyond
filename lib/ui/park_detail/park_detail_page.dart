import 'package:beyond/ui/park_detail/park_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ParkDetailPage extends StatelessWidget {
  final ParkDetailViewModel viewModel;

  const ParkDetailPage(this.viewModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(viewModel.park.name);
        }),
      ),
      body: Container(),
    );
  }
}

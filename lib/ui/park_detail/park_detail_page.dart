import 'package:beyond/ui/park_detail/park_detail_view_model.dart';
import 'package:flutter/material.dart';

class ParkDetailPage extends StatelessWidget {
  final ParkDetailViewModel viewModel;

  const ParkDetailPage(this.viewModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.parkName),
      ),
      body: Container(
        child: Image.network(
          viewModel.parkImageUrl,
          loadingBuilder: (context, widget, chunk) {
            if (chunk == null) return widget;
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

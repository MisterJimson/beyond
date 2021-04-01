import 'package:beyond/ui/park_detail/park_detail_view_model.dart';
import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:flutter/material.dart';

class ParkDetailPage extends StatelessWidget {
  final ParkDetailViewModel viewModel;

  const ParkDetailPage(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelRoot(
      viewModel: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.parkName),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white70,
              height: 414,
              width: 414,
              child: Image.network(
                viewModel.parkImageUrl,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(viewModel.distanceFrom),
            ),
          ],
        ),
      ),
    );
  }
}

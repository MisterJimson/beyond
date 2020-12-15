import 'package:beyond_helpers/src/view_model.dart';
import 'package:flutter/widgets.dart';

/// A [Widget] that wraps all [Widget]s dependent on a ViewModel
///
/// This [Widget] will dispose the ViewModel when it's no longer needed.
class ViewModelRoot extends StatefulWidget {
  final ViewModel viewModel;
  final Widget child;

  const ViewModelRoot({
    Key? key,
    required this.viewModel,
    required this.child,
  }) : super(key: key);

  @override
  _ViewModelRootState createState() => _ViewModelRootState();
}

class _ViewModelRootState extends State<ViewModelRoot> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.dispose();
  }
}

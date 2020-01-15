import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

/// Base class that all ViewModels extend from
abstract class ViewModel {
  /// Mobx reactions return a [ReactionDisposer] so that they can be
  /// disposed of when they are no longer needed
  ///
  /// ViewModels adding [ReactionDisposer]s to the [disposers] list
  /// allows them to be disposed at the correct time
  List<ReactionDisposer> disposers = [];

  /// Dispose all of a [ViewModel]'s [ReactionDisposer]s
  void dispose() {
    disposers.forEach((d) => d());
  }
}

/// A [Widget] that wraps all other [Widget]s dependent on a ViewModel
///
/// This [Widget] will dispose the ViewModel when it's no longer needed.
class ViewModelRoot extends StatefulWidget {
  final ViewModel viewModel;
  final Widget child;

  const ViewModelRoot({
    Key key,
    @required this.viewModel,
    @required this.child,
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

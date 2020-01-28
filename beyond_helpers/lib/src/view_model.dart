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

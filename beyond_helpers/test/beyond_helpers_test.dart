import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_view_model.dart';

void main() {
  testWidgets('ViewModelRoot disposes ViewModel when Page is popped',
      (WidgetTester tester) async {
    // Create ViewModel and Page
    var viewModel = TestViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: _TestPage(viewModel),
      ),
    );

    // ViewModel should start inactive, no reactions setup
    expect(viewModel.disposers.length, 0);
    expect(find.text('0'), findsOneWidget);

    // Setup reactions, ensure we have them in disposers list
    viewModel.setupReactions();
    expect(viewModel.disposers.length, 2);

    // Use reactions and ensure they work
    viewModel.testAction();
    await tester.pump();
    expect(find.text('new1'), findsOneWidget);

    // Navigate away from the current page, triggering dispose on ViewModelRoot
    await tester.tap(find.widgetWithText(RaisedButton, 'Navigate Away'));
    await tester.pumpAndSettle();

    // Ensure we called dispose on all disposers
    viewModel.disposers
        .forEach((disposer) => expect(disposer.reaction.isDisposed, true));
  });
}

class _TestPage extends StatelessWidget {
  final TestViewModel viewModel;

  const _TestPage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ViewModelRoot(
      viewModel: viewModel,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return Text(viewModel.testComputed);
              },
            ),
            RaisedButton(
              child: Text('Navigate Away'),
              onPressed: () {
                Navigator.of(context)!.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => Container()),
                  (Route<dynamic> route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

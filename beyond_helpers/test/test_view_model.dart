import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:mobx/mobx.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModel with _$TestViewModel;

abstract class _TestViewModel extends ViewModel with Store {
  @observable
  String testString = '';

  @observable
  int testInt = 0;

  @computed
  String get testComputed => testString + testInt.toString();

  @action
  void testAction() {
    testString = 'new';
    testInt++;
  }

  void setupReactions() {
    disposers.add(autorun((_) {
      print('testString is $testString');
    }));

    disposers.add(reaction<int>((_) => testInt, (int x) {
      print('testInt is $testInt');
    }));
  }
}

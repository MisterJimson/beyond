import 'package:flutter/material.dart';
import 'package:beyond/infra/service_locator.dart';

void main() => runApp(MyApp(ServiceLocator()));

class MyApp extends StatefulWidget {
  final ServiceLocator _serviceLocator;

  const MyApp(this._serviceLocator);

  @override
  _MyAppState createState() => _MyAppState(_serviceLocator);
}

class _MyAppState extends State<MyApp> {
  final ServiceLocator _serviceLocator;

  _MyAppState(this._serviceLocator);

  @override
  void initState() {
    super.initState();
    _serviceLocator.start().then((x) {
      _serviceLocator.authManager.loadSavedLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mvvm Plus',
      navigatorKey: _serviceLocator.navigationManager.navigatorKey,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.tealAccent),
      home: Container(color: Colors.white),
    );
  }
}

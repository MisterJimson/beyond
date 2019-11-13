import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:beyond/ui/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomePage(this.viewModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (viewModel.placeDesc != null) _buildCurrentPlace(),
                SizedBox(height: 10),
                _buildParks(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogoutButton(),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildParks() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Nearby Parks",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...viewModel.pointsOfInterest
                .map(
                  (x) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(x.nameAndDistance),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPlace() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Current Location",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(viewModel.placeDesc),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: viewModel.logout,
      color: Colors.blue,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "LOGOUT",
        textAlign: TextAlign.center,
      ),
    );
  }
}

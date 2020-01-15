import 'package:beyond/ui/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beyond/ui/login/login_view_model.dart';

class LoginPage extends StatelessWidget {
  final LoginViewModel viewModel;

  const LoginPage(
    this.viewModel, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelRoot(
      viewModel: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 30.0),
                SvgPicture.asset("assets/welcome.svg", width: 150),
                SizedBox(height: 45.0),
                _buildEmail(),
                SizedBox(height: 25.0),
                _buildPassword(),
                SizedBox(height: 35.0),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Observer(
      builder: (_) {
        return RaisedButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed:
              viewModel.isLoginButtonEnabled ? viewModel.login : null,
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Observer(builder: (_) {
            if (viewModel.isLoading) {
              return SizedBox(
                height: 17,
                width: 17,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            } else {
              return Text(
                "LOGIN",
                textAlign: TextAlign.center,
              );
            }
          }),
        );
      },
    );
  }

  Widget _buildPassword() {
    return TextField(
      key: Key("passwordField"),
      obscureText: true,
      onChanged: (x) => viewModel.password = x,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return TextField(
      key: Key("emailField"),
      obscureText: false,
      onChanged: (x) => viewModel.username = x,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}

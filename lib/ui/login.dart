import 'package:cinnamon/networking/cinnema_api.dart';
import 'package:cinnamon/shared/ui.dart';
import 'package:cinnamon/ui/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (String email) {
                this._email = email;
              },
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Password"),
              onChanged: (String pass) {
                this._password = pass;
              },
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: _login,
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    CinnemaApi.login(_email, _password)
        .then((user) => Navigator.pushReplacement(this.context,
            MaterialPageRoute(builder: (BuildContext ctx) => HomePage())))
        .catchError((error) => UIUtils.error(error));
  }
}

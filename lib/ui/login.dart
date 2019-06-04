import 'package:cinnamon/api/cinnema_api.dart';
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
  bool _saveLogin = true;

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
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16.0,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                  onChanged: (String email) => this._email = email
                ),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Password"),
                  onChanged: (String pass) => this._password = pass
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: this._saveLogin,
                        onChanged: (bool saveLogin) => setState(() => this._saveLogin = saveLogin)
                    ),
                    Text("Save login")
                  ]
                ),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: _login,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    CinnemaApi.login(_email, _password, _saveLogin)
        .then((user) => Navigator.pushReplacement(this.context,
            MaterialPageRoute(builder: (BuildContext ctx) => HomePage())))
        .catchError((error) => UIUtils.notifyError("Login error"));
  }
}

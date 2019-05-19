import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password"
              ),
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

  }
}
import 'package:cinnamon/shared/constants.dart';
import 'package:cinnamon/ui/home.dart';
import 'package:cinnamon/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  var preferences = await SharedPreferences.getInstance();
  var isUserLogged = preferences.containsKey(Constants.ID_PREFERENCE);

  runApp(MaterialApp(
    title: "Cinnamon",
    home: isUserLogged ? HomePage() : LoginPage(),
  ));
}

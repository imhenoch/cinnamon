import 'package:flutter/material.dart';
import 'package:cinnamon/ui/login.dart';

Future<void> main() async {
  runApp(CinnamonApp());
}

class CinnamonApp extends StatefulWidget {
  @override
  _CinnamonAppState createState() => _CinnamonAppState();
}

class _CinnamonAppState extends State<CinnamonApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinnamon',
      home: LoginPage(),
    );
  }
}
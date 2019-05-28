import 'package:cinnamon/api/cinnema_api.dart';
import 'package:cinnamon/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Movies", Icons.movie),
    DrawerItem("Categories", Icons.category)
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  User _user = User(id: 0, email: "", token: "");

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  List<Widget> _drawerOptions() {
    var drawerOptions = <Widget>[];
    widget.drawerItems.asMap().forEach((index, item) {
      drawerOptions.add(ListTile(
        leading: Icon(item.icon),
        title: Text(item.title),
        selected: index == _selectedDrawerIndex,
        onTap: () => _onSelectItem(index),
      ));
    });
    return drawerOptions;
  }

  @override
  void initState() {
    super.initState();
    CinnemaApi.getUser().then((user) => _user = user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_user.email),
              accountEmail: null,
            ),
            Column(
              children: _drawerOptions(),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

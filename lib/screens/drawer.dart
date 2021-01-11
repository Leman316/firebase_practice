import 'package:firebase_practice/screens/add_info.dart';
import 'package:firebase_practice/screens/show_info.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Options'),
            automaticallyImplyLeading: true,
          ),
          Divider(),
          ListTile(
            title: Text('Add Info'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AddInformation.routename);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Show Data'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ShowInformation.routename);
            },
          )
        ],
      ),
    );
  }
}

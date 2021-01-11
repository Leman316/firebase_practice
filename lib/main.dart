import 'package:firebase_practice/providers/notes.dart';
import 'package:firebase_practice/screens/show_info.dart';
import 'package:provider/provider.dart';

import './screens/add_info.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Notes(),
      child: MaterialApp(
        title: 'Firebase Practice',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: HomeScreen(),
        routes: {
          AddInformation.routename: (ctx) => AddInformation(),
          ShowInformation.routename: (ctx) => ShowInformation(),
        },
      ),
    );
  }
}

import 'package:firebase_practice/providers/notes.dart';

import 'drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practicing with Firebase'),
        actions: [],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('fsa'),
      ),
    );
  }
}

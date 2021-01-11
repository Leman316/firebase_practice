import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practicing with Firebase'),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}

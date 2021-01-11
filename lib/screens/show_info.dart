import 'package:firebase_practice/providers/notes.dart';
import 'package:firebase_practice/screens/drawer.dart';
import 'package:firebase_practice/widgets/show_info_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowInformation extends StatefulWidget {
  static const routename = '/showinfo';

  @override
  _ShowInformationState createState() => _ShowInformationState();
}

class _ShowInformationState extends State<ShowInformation> {
  @override
  void initState() {
    Future.delayed(Duration.zero)
        .then((_) => Provider.of<Notes>(context, listen: false).fetchNotes());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final note = Provider.of<Notes>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Show Information'),
        actions: <Widget>[],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: note.notes.length,
          itemBuilder: (context, index) => ShowInfoGrids(note.notes[index])),
    );
  }
}

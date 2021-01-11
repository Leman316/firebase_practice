import 'package:firebase_practice/providers/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes.dart' as Nte;

class ShowInfoGrids extends StatelessWidget {
  final Nte.NotesItem notes;

  ShowInfoGrids(this.notes);
  @override
  Widget build(BuildContext context) {
    //final notes=Provider.of<Notes>(context).notes;
    return Container(
      child: Center(
        child: Text(notes.title),
      ),
    );
  }
}

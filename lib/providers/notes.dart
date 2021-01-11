import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotesItem {
  String noteId;
  String title;
  int day;
  String month;
  int year;
  String description;

  NotesItem(
      {this.noteId,
      this.title,
      this.day,
      this.month,
      this.year,
      this.description});
}

class Notes with ChangeNotifier {
  List<NotesItem> _notes = [
    NotesItem(
      noteId: 'sf',
      title: 'gsa',
      day: DateTime.now().day,
      month: DateFormat.MMM().format(DateTime.now()),
      year: DateTime.now().year,
      description: 'fasgsvasgsagahsa',
    )
  ];

  List<NotesItem> get notes {
    return [..._notes];
  }

  Future<void> fetchNotes() async {
    final url = "https://notes-c8b88-default-rtdb.firebaseio.com/Notes.json";
    final resp = await http.get(url);
    final extractedData = jsonDecode(resp.body) as Map;
    List<NotesItem> loadedNotes = [];
    print(extractedData);

    extractedData.forEach((key, value) {
      loadedNotes.add(NotesItem(
        noteId: key,
        description: value['description'],
        title: value['title'],
        day: value['day'],
        month: value['month'],
        year: value['year'],
      ));
    });
    _notes = loadedNotes.toList();

    notifyListeners();
  }

  Future<void> addNotes(NotesItem note) async {
//    print(note.date);
    final url = "https://notes-c8b88-default-rtdb.firebaseio.com/Notes.json";
    final resp = await http.post(url,
        body: jsonEncode({
          'title': note.title,
          'description': note.description,
          'year': note.year,
          'month': note.month,
          'day': note.day,
        }));

    _notes.insert(
        0,
        NotesItem(
            title: note.title,
            description: note.description,
            day: note.day,
            month: note.month,
            year: note.year,
            noteId: jsonDecode(resp.body)['name']));
    notifyListeners();
  }
}

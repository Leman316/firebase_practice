import 'dart:convert';

import 'package:firebase_practice/helpers/db_helper.dart';
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
  List<NotesItem> _notes = [];

  List<NotesItem> get notes {
    return [..._notes];
  }

  Future<void> fetchNotes() async {
    final url = "https://notes-c8b88-default-rtdb.firebaseio.com/Notes.json";
    final resp = await http.get(url);
    final extractedData = jsonDecode(resp.body) as Map;
    List<NotesItem> loadedNotes = [];
    // print(extractedData);

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

    _notes.forEach((element) {
      DBHelper.insert('notes', {
        'title': element.title,
        //'desc': element.description,
        'day': element.day,
        'month': element.month,
        'year': element.year,
      });
    });

    final datalist = await DBHelper.getData('notes');
    print(datalist);
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

    final newNote = NotesItem(
        title: note.title,
        description: note.description,
        day: note.day,
        month: note.month,
        year: note.year,
        noteId: jsonDecode(resp.body)['name']);
    _notes.add(newNote);

    notifyListeners();
  }
}

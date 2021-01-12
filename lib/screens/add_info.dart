import 'package:firebase_practice/providers/notes.dart';
import 'package:firebase_practice/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddInformation extends StatefulWidget {
  static const routename = '/auth';

  @override
  _AddInformationState createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  final _dateFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  NotesItem _editednote = NotesItem(
      noteId: null,
      title: '',
      day: DateTime.now().day,
      month: DateFormat.MMM().format(DateTime.now()),
      year: DateTime.now().year,
      description: '');

  @override
  void dispose() {
    // TODO: implement dispose
    _dateFocusNode.dispose();
    _descFocusNode.dispose();
    super.dispose();
  }

  void _saveform() {
    _form.currentState.save();
    print(_editednote.title);
    //  print(_editednote.date);
    Provider.of<Notes>(context, listen: false).addNotes(_editednote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveform,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                onSaved: (newValue) {
                  _editednote = NotesItem(
                      noteId: null,
                      title: newValue,
                      day: _editednote.day,
                      month: _editednote.month,
                      year: _editednote.year,
                      description: _editednote.description);
                },
              ),
              InputDatePickerFormField(
                firstDate: DateTime.utc(2011),
                lastDate: DateTime.now(),
                onDateSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
                onDateSaved: (newValue) {
                  _editednote = NotesItem(
                      noteId: null,
                      title: _editednote.title,
                      day: newValue.day,
                      month: DateFormat.MMM().format(newValue),
                      year: newValue.year,
                      description: _editednote.description);
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                focusNode: _descFocusNode,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                onSaved: (newValue) {
                  _editednote = NotesItem(
                      noteId: null,
                      title: _editednote.title,
                      day: _editednote.day,
                      month: _editednote.month,
                      year: _editednote.year,
                      description: newValue);
                },
                onFieldSubmitted: (_) {
                  _saveform();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

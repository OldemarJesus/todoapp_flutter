import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/classes/note.dart';

class NoteRepository extends ChangeNotifier {

  final List<Note> _notes = [];

  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  void add (Note note) {
    if(_notes.contains(note)){
      return;
    }

    _notes.add(note);

    notifyListeners();
  }

  void remove (Note note) {
    if(!_notes.contains(note)){
      return;
    }

    _notes.remove(note);

    notifyListeners();
  }

  void removeAll(){
    _notes.clear();

    notifyListeners();
  }

}
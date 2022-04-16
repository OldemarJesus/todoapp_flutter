import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/classes/note.dart';

class NoteRepository extends ChangeNotifier {
  final List<Note> _notes = [];

  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  void add(Note note) {
    if (_notes.contains(note)) {
      return;
    }

    _notes.add(note);

    notifyListeners();
  }

  void update(Note note, DateTime time) {
    final int noteIndex = getIndexOf(_notes, time);

    if (noteIndex == -1) {
      return;
    }

    _notes[noteIndex] = note;

    print(note.title);

    notifyListeners();
  }

  int getIndexOf(List<Note> notes, DateTime time) {
    for (var i = 0; i < notes.length; i++) {
      Note note = notes[i];

      if (note.time.compareTo(time) == 0) {
        return i;
      }
    }

    return -1;
  }

  void remove(Note note) {
    if (!_notes.contains(note)) {
      return;
    }

    _notes.remove(note);

    notifyListeners();
  }

  void removeAll() {
    _notes.clear();

    notifyListeners();
  }
}

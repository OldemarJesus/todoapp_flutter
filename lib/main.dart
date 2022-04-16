import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/repository/notes_repository.dart';
import 'package:todo_app/screens/addNote.dart';
import 'package:todo_app/screens/editNote.dart';
import 'package:todo_app/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NoteRepository(),
    child: MaterialApp(routes: {
      '/': (context) => Home(),
      '/edit': (context) => Edit(),
      '/add': (context) => Add(),
    }),
  ));
}

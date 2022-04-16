import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/note.dart';
import 'package:todo_app/repository/notes_repository.dart';
import 'package:todo_app/screens/editNote.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Note> notes;

  @override
  Widget build(BuildContext context) {
    NoteRepository noteRepository = Provider.of<NoteRepository>(context);
    notes = noteRepository.notes;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("To-Do"),
        ),
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: (notes.length > 0)
            ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, noteIndex) {
                  return ListTile(
                    title: Text(notes[noteIndex].title),
                    subtitle: Text(notes[noteIndex].description),
                    trailing: TextButton.icon(
                        onPressed: () {
                          noteRepository.remove(notes[noteIndex]);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        label: Text(
                          "Del",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                    onTap: () => {
                      Navigator.pushNamed(context, '/edit',
                          arguments: notes[noteIndex])
                    },
                  );
                },
              )
            : Text("Sem notas!"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.add)),
    );
  }
}

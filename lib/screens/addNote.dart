import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/note.dart';
import 'package:todo_app/repository/notes_repository.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final title = TextEditingController();
  final decription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NoteRepository noteRepository = Provider.of<NoteRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("To-do Add"),
        ),
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: "),
            TextField(
              controller: title,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text("Description: "),
            TextField(
              controller: decription,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      String _title = title.text;
                      String _description = decription.text;

                      if (_title.length > 0 && _description.length > 0) {
                        Note note =
                            Note(description: _description, title: _title);

                        noteRepository.add(note);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Information'),
                            content: const Text('Title and Description are required!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Save")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

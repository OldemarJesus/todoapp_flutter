import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/classes/note.dart';
import 'package:todo_app/repository/notes_repository.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    NoteRepository noteRepository = Provider.of<NoteRepository>(context);
    final noteArg = ModalRoute.of(context)!.settings.arguments as Note;
    final title = TextEditingController(text: noteArg.title);
    final description = TextEditingController(text: noteArg.description);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("To-do Edit"),
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
              controller: description,
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
                      final _title = title.text;
                      final _description = description.text;

                      if (_title.length == 0 || _description.length == 0) {
                        return;
                      }

                      Note newNote =
                          Note(title: _title, description: _description);

                      noteRepository.update(newNote, noteArg.time);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: Text("Save Changes")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

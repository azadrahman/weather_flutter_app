import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/notes_data.dart';
import 'package:weather/widgets/note_list.dart';

import '../screens/add_note_screen.dart';

class NotesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
        builder: (context, notesData, child) {
          return  Container(
            padding: const EdgeInsets.all(20),
            child: notesData.notes.isEmpty ? const ListTile(
              title: Text(
                'No note added yet!', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
              ),
            ) : ListView.builder(
              itemBuilder: (context, index) {
                final note = notesData.notes[index];
                return NoteList(title: note.title ?? '',
                  isChecked: note.isDone,
                  toggleCheckState: (value) {
                   notesData.updateNoteCheckbox(note);
                  },
                  onDoubleTapCallback: () {
                    showModalBottomSheet(context: context, builder: (context) => AddNoteScreen(textUpdate: note.title, itemIndex: index));
                  },
                  onPressCallback: () {
                  notesData.deleteNote(note);
                  const snackBar = SnackBar(
                    backgroundColor: Color(0xff757575),
                    content: Text('Item deleted', style: TextStyle(fontSize: 20, color: Colors.white),),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              },
              itemCount: notesData.notesCount,
            ),
          );
        }
    );
  }
}

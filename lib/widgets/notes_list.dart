import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/notes_data.dart';
import 'package:weather/widgets/note_list.dart';

class NotesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
        builder: (context, notesData, child) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final note = notesData.notes[index];
                return NoteList(title: note.title ?? '',
                  isChecked: note.isDone,
                  toggleCheckState: (value) {
                   notesData.updateNote(note);
                  },
                  onPressCallback: () {
                  notesData.deleteNote(note);
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

import 'package:flutter/material.dart';
import 'package:weather/widgets/note_list.dart';

import '../models/notes_model.dart';

class NotesList extends StatefulWidget {

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<NoteModel> notes = [
    NoteModel(title: "Hi there", isDone: false),
    NoteModel(title: "New Notes", isDone: false),
    NoteModel(title: 'This is some', isDone: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NoteList(title: notes[index].title ?? '', isChecked: notes[index].isDone,
            toggleCheckState: (value) {
              setState(() {
                notes[index].toggleDone();
              });
            },
            );
          },
          itemCount: notes.length,
        )
    );;
  }
}

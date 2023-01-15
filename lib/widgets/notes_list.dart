import 'package:flutter/material.dart';
import 'package:weather/widgets/note_list.dart';

import '../models/notes_model.dart';

class NotesList extends StatefulWidget {
  final List<NoteModel> notes;

  NotesList(this.notes);

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NoteList(title: widget.notes[index].title ?? '', isChecked: widget.notes[index].isDone,
            toggleCheckState: (value) {
              setState(() {
                widget.notes[index].toggleDone();
              });
            },
            );
          },
          itemCount: widget.notes.length,
        )
    );;
  }
}

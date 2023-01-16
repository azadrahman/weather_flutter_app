import 'dart:collection';
import 'package:flutter/material.dart';
import 'notes_model.dart';

class NoteData extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  UnmodifiableListView<NoteModel> get notes {
    return UnmodifiableListView(_notes);
  }

  int get notesCount {
    return _notes.length;
  }

  void addNote(String newTitle) {
    final note = NoteModel(title: newTitle);
    _notes.add(note);
    notifyListeners();
  }

  void updateNoteCheckbox(NoteModel note) {
    note.toggleDone();
    notifyListeners();
  }

  void updateNote(String updateTitle, int index) {
    final note = NoteModel(title: updateTitle);
    _notes[index] = note;
    notifyListeners();
  }

  void deleteNote(NoteModel note) {
    _notes.remove(note);
    notifyListeners();
  }
}
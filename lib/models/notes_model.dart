class NoteModel {
  final String? title;
  bool isDone;

  NoteModel({this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
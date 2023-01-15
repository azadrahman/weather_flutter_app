import 'package:flutter/material.dart';
import 'package:weather/screens/add_note_screen.dart';
import '../models/notes_model.dart';
import '../widgets/notes_list.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<NoteModel> notes = [
    NoteModel(title: "Hi there", isDone: false),
    NoteModel(title: "New Notes", isDone: false),
    NoteModel(title: 'This is some', isDone: false)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.note_add_outlined, size: 30,),
                  ),
                 const SizedBox(height: 10,),
                 const Text('Today\'s notes', style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                const  SizedBox(height: 10,),
                 Text('${notes.length} notes', style: const TextStyle(color: Colors.white70, fontSize: 18),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: NotesList(notes),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => AddNoteScreen((value) {
           setState(() {
             notes.add(NoteModel(title: value));
           });
            Navigator.pop(context);
          },));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}

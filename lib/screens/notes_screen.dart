import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/notes_data.dart';
import 'package:weather/screens/add_note_screen.dart';
import '../widgets/notes_list.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

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
                 Text('${Provider.of<NoteData>(context).notesCount} notes', style: const TextStyle(color: Colors.white70, fontSize: 18),)
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
                child: NotesList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => AddNoteScreen());
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}

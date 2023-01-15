import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/notes_data.dart';

class AddNoteScreen extends StatefulWidget {

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String? newNoteText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const Text('Add Note', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),),
           const SizedBox(height: 15,),
            TextField(
              style: const TextStyle(color: Colors.black),
              autofocus: false,
              decoration:const InputDecoration(
                filled: true,
                fillColor: Color(0xffdddddd),
                hintText: 'enter new note',
                hintStyle: TextStyle(color: Colors.grey)
              ),
              onChanged: (value) {
                setState(() {
                  newNoteText = value;
                });
              },
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
                onPressed: () {
              Provider.of<NoteData>(context, listen: false).addNote(newNoteText!);
              Navigator.pop(context);
            }, child: const Text('Add')),
          ],
        ),
      ),
    );
  }
}

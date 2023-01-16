import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/notes_data.dart';

class AddNoteScreen extends StatefulWidget {
  final String? textUpdate;
  final int? itemIndex;
  AddNoteScreen({this.textUpdate, this.itemIndex});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.textUpdate != null) {
      textController.text = widget.textUpdate!;
    }else{
      textController.text = '';
    }
  }

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
           Text(widget.textUpdate != null ? "Update Note" : 'Add Note', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),),
           const SizedBox(height: 15,),
            TextField(
              controller: textController,
              style: const TextStyle(color: Colors.black),
              autofocus: false,
              decoration:const InputDecoration(
                filled: true,
                fillColor: Color(0xffdddddd),
                hintText: 'enter new note',
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
                onPressed: () {
                 if(widget.itemIndex != null) {
                   Provider.of<NoteData>(context, listen: false).updateNote(textController.text, widget.itemIndex!);
                 }else{
                   Provider.of<NoteData>(context, listen: false).addNote(textController.text);
                 }
              Navigator.pop(context);
            }, child: const Text('Add')),
          ],
        ),
      ),
    );
  }
}

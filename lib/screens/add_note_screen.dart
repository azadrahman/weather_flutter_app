import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

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
            const TextField(
              style: TextStyle(color: Colors.black),
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffdddddd),
                hintText: 'enter new note',
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            const SizedBox(height: 8,),
            ElevatedButton(onPressed: () {}, child: const Text('Add')),
          ],
        ),
      ),
    );
  }
}

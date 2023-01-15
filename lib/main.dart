import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:weather/screens/notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home:const SafeArea(
        child: NotesScreen(),
      ),
    );
  }
}
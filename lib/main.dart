import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/notes_data.dart';
import 'package:weather/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const SafeArea(
          child: LoadingScreen(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Presention/Screens/add_note.dart';
import 'Presention/Screens/edit_notes.dart';

import 'Constns/mycolors.dart';
import 'Presention/Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: MyColors.myBlack,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        AddNote.id: (context) => const AddNote(),
        HomePage.id: (context) => const HomePage(),
        EditNotes.id: (context) => const EditNotes(),
      },
    );
  }
}

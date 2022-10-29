// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:sqflite_project/Data/Model/db_model.dart';
import 'package:sqflite_project/Presention/Screens/home_page.dart';

import '../../Data/Web_Services/db_helper.dart';
import '../Widgets/custom_text_filed.dart';

class EditNotes extends StatefulWidget {
  final String? title;
  final String? body;
  final int? myid;

  const EditNotes({super.key, this.title, this.body, this.myid});

  static String id = 'EditNotes';

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  TextEditingController titleContoller = TextEditingController();
  TextEditingController bodyContoller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    titleContoller.text = widget.title!;
    bodyContoller.text = widget.body!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataBaseHelper db = DataBaseHelper();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () async {
            await editNote(db, context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              CustomTextField(
                controller: titleContoller,
                hintText: 'Title',
                color: Colors.white,
                hintStyleColor: Colors.white,
              ),
              MultiTextField(
                controller: bodyContoller,
                hintText: 'Notes',
                color: Colors.white,
                hintStyleColor: Colors.white,
              ),
              const SizedBox(height: 10),
              // MaterialButton(
              //   onPressed: () async {
              //     await editNote(db, context);
              //   },
              //   color: Colors.red,
              //   child: const Text(
              //     'Edit Note',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editNote(DataBaseHelper db, BuildContext context) async {
    await db
        .updateData(
      UserModel(
        title: titleContoller.text,
        body: bodyContoller.text,
        id: widget.myid,
      ),
    )
        .then((value) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    });
  }
}

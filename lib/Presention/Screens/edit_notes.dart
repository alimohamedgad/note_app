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
  final UserModel? users;

  const EditNotes({
    Key? key,
    this.title,
    this.body,
    this.myid,
    this.users,
  }) : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {
                db.deleteData(widget.users!.id!).then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomePage.id, (route) => false);
                });
              },
              icon: const Icon(Icons.delete_rounded))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                hintText: 'Your Notes',
                color: Colors.white,
                hintStyleColor: Colors.white,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future editNote(DataBaseHelper db, BuildContext context) async {
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

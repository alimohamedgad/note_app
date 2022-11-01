import 'package:flutter/material.dart';

import '../../Constns/mycolors.dart';
import '../../Data/Model/db_model.dart';
import '../../Data/Web_Services/db_helper.dart';
import '../Widgets/custom_text_filed.dart';
import 'home_page.dart';

class AddNote extends StatefulWidget {
  const AddNote({
    Key? key,
  }) : super(key: key);
  static String id = 'AddNote';

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();


    DataBaseHelper db = DataBaseHelper();
    return Scaffold(
      backgroundColor: MyColors.myBlack,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () async {
            await addNote(
              formkey,
              db,
              titleController,
              bodyController,
              context,
            );
           
            
          },
          color: Colors.white,
        ),
        backgroundColor: MyColors.myBlack,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              CustomTextField(
                controller: titleController,
                hintText: 'Title Note',
                color: Colors.white,
              ),
              MultiTextField(
                controller: bodyController,
                hintText: 'Your Note',
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addNote(
    GlobalKey<FormState> formkey,
    DataBaseHelper db,
    TextEditingController titleContoller,
    TextEditingController bodyController,
    BuildContext context,
  ) async {
    formkey.currentState!.save();
    await db
        .insert(
      UserModel(
        title: titleContoller.text,
        body: bodyController.text,
      ),
    )
        .then(
      (value) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      },
    );
  }
}

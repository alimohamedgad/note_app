// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sqflite_project/Presention/Screens/home_page.dart';

import '../../Constns/mycolors.dart';
import '../../Data/Model/db_model.dart';
import '../../Data/Web_Services/db_helper.dart';
import '../Screens/edit_notes.dart';

class NoteItem extends StatelessWidget {
  final DataBaseHelper db;
  final List<UserModel> users;
  final int index;
  const NoteItem({
    Key? key,
    required this.db,
    required this.users,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          bottom: 10, start: 10, end: 10, top: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNotes(
                title: users[index].title,
                body: users[index].body,
                myid: users[index].id,
                users: users[index],
              ),
            ),
          );
        },
        child: Dismissible(
          key: UniqueKey(),
          background: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onDismissed: (direction) async{
           await deleteNote(context);
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: colorsList[index % colorsList.length],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  users[index].title!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: MyColors.myBlack,
                  ),
                ),
                subtitle: Text(
                  users[index].body!,
                  maxLines: 7,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MyColors.myBlack,
                  ),
                ),
              )),
        ),
      ),
    );
  }

  deleteNote(context) {
    db.deleteData(users[index].id!).then((value) {
      if (value > 0) {
        users.removeWhere((element) => element.id == users[index].id);
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }
    });
  }
  }


// colorsList[index % colorsList.length]  => Generet Colors everey new Note from List
// Colors.primaries[Random().nextInt(Colors.primaries.length)] => to make generet Colors revey new Note
                   


// Dismissible(
//       );
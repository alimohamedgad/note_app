import 'package:flutter/material.dart';

import '../../Constns/mycolors.dart';
import '../../Data/Model/db_model.dart';
import '../../Data/Web_Services/db_helper.dart';
import '../Screens/edit_notes.dart';
import 'notes_list_tile.dart';

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
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onDismissed: (direction) {
        db.deleteData(users[index].id!).then((value) {
          if (value > 0) {
            users.removeWhere((element) => element.id == users[index].id);
          }
        });
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNotes(
                title: users[index].title,
                body: users[index].body,
                myid: users[index].id,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: MyColors.myBlack,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: NotesListTile(
            index: index,
            users: users,
          ),
        ),
      ),
    );
  }
}

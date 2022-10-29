import 'package:flutter/material.dart';

import '../../Data/Model/db_model.dart';

class NotesListTile extends StatelessWidget {
  const NotesListTile({
    Key? key,
    required this.users,
    required this.index,
  }) : super(key: key);

  final List<UserModel> users;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        users[index].title!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        users[index].body!,
        maxLines: 2,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}




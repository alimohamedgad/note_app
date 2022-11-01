import 'package:flutter/material.dart';

import '../../Constns/mycolors.dart';
import '../../Data/Model/db_model.dart';

class NotesListTile extends StatelessWidget {
  const NotesListTile({
    Key? key,
    required this.users,
  }) : super(key: key);

  final UserModel users;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        users.title!,
        style: const TextStyle(
          fontSize: 12,
          color: MyColors.myBlack,
        ),
      ),
      subtitle: Text(
        users.body!,
        maxLines: 7,
        style: const TextStyle(
          fontSize: 14,
          color: MyColors.myBlack,
        ),
      ),
    );
  }
}

class NotesListTile2 extends StatelessWidget {
  const NotesListTile2({
    Key? key,
    required this.users,
  }) : super(key: key);

  final UserModel users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Text(
            users.title!,
            style: const TextStyle(
              fontSize: 12,
              color: MyColors.myBlack,
            ),
          ),
          Text(
            users.body!,
            textAlign: TextAlign.center,
            maxLines: 6,
            style: const TextStyle(
              fontSize: 14,
              color: MyColors.myBlack,
            ),
          ),
        ],
      ),
    );
  }
}

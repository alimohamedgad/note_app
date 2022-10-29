// ignore_for_file: unused_label

import 'package:sqflite_project/Constns/db_const.dart';

class UserModel {
  String? title;
  String? body;
  int? id;
  UserModel({
    this.title,
    this.body,
    this.id,
  });

  UserModel.fromjson(json) {
    id = json[columnId];
    title = json[columnName];
    body = json[columnEmail];
  }

  tojson() {
    return {
      columnId: id,
      columnName: title,
      columnEmail: body,
    };
  }
}

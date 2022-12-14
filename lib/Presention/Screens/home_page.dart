// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_project/Bussiness_logic/cubit/database_cubit.dart';
import 'package:sqflite_project/Constns/mycolors.dart';
import 'package:sqflite_project/Data/Model/db_model.dart';
import 'package:sqflite_project/Data/Web_Services/db_helper.dart';
import 'package:sqflite_project/Presention/Screens/add_note.dart';

import '../Widgets/notes_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  DataBaseHelper db = DataBaseHelper();
  List<UserModel> users = [];

  Future<List<UserModel>> readData() async {
    await db.getData().then((value) {
      users = value;
      setState(() {});
      print(users.length);
    });
    return users;
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBlack,
      appBar: myAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNote.id);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              child: users.isNotEmpty
                  ? ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, i) {
                        return NoteItem(
                          db: db,
                          users: users,
                          index: i,
                        );
                      },
                    )
                  : Center(
                      child: Text(
                      "You Don't Have Any Note !!",
                      style: TextStyle(fontSize: 20),
                    ))),
        ],
      ),
    );
    }
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: MyColors.myBlack,
      elevation: 0.0,
      title: const Text('Notes', style: TextStyle(fontSize: 30)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
      // leading: IconButton(
      //     onPressed: () async {
      //       await db.mydeleteDataBase();
      //     },
      //     icon: const Icon(Icons.remove)),
    );
  }

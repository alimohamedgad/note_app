// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqflite_project/Constns/mycolors.dart';
import 'package:sqflite_project/Data/Model/db_model.dart';
import 'package:sqflite_project/Data/Web_Services/db_helper.dart';
import 'package:sqflite_project/Presention/Screens/add_note.dart';

import 'edit_notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

// late UserModel userList;

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  DataBaseHelper db = DataBaseHelper();
  List<UserModel> users = [];

  Future<List<UserModel>> readData() async {
    await db.getData().then((value) {
      users = value;
      setState(() {});
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
      appBar: AppBar(
        backgroundColor: MyColors.myBlack,
        elevation: 0.0,
        title: const Text('Notes', style: TextStyle(fontSize: 30)),
        actions: [
          Container(
            width: 42,
            margin: const EdgeInsets.fromLTRB(0, 10, 15, 0),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          )
        ],
        // leading: IconButton(
        //     onPressed: () async {
        //       await db.mydeleteDataBase();
        //     },
        //     icon: const Icon(Icons.remove)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.pushNamed(context, AddNote.id);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (context, i) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  height: 60,
                ),
                onDismissed: (direction) {
                  db.deleteData(users[i].id!);
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNotes(
                          title: users[i].title,
                          body: users[i].body,
                          myid: users[i].id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.only(
                        bottom: 0, left: 4, right: 4, top: 12),
                    decoration: BoxDecoration(
                      color: MyColors.myBlack,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,

                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            users[i].title.toString(),
                            style: const TextStyle(
                                fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



// Card(
//                   child: ListTile(
//                     title: Text(users[i].body!),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditNotes(
//                               email: users[i].body,
//                               name: users[i].title,
//                               myid: users[i].id,
//                             ),
//                           ),
//                         );
//                       },
//                       icon: const Icon(Icons.edit),
//                     ),
//                   ),
//                 ),
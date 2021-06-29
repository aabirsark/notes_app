import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/provider/user_data_provider.dart';
import 'package:notes_app/screens/add_note_screen.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/widgets/app_bar_widget.dart';
import 'package:notes_app/widgets/note_grid_List.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _documentReference = FirebaseFirestore.instance;
  var subscription;

  final notes = [];

  @override
  void initState() {
    super.initState();
    User user;

    FirebaseAuth.instance.userChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        _signInAnonymously();
      } else {
        user = user;
        Provider.of<UserDataProvider>(context, listen: false).setUser(user);
        print('User is signed in! and id = ${user.uid}');

        subscription = FirebaseFirestore.instance
            .collection("Data")
            .doc("${context.read<UserDataProvider>().user.uid}")
            .collection("Notes")
            .snapshots()
            .listen((event) {
          if (user != null) {
            _setData();
          }
        });
        if (notes.isEmpty) {
          _setData();
        }
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    notes.clear();
    super.dispose();
  }

  _setData() {
    print("calling set data");
    _documentReference
        .collection("Data")
        .doc("${context.read<UserDataProvider>().user.uid}")
        .collection("Notes")
        .get()
        .then((QuerySnapshot snapshot) {
      notes.clear();
      snapshot.docs.forEach((element) {
        print("done fetch");

        notes.add(element.data());
        print("${element.data()}");
      });
      setState(() {});
    });
  }

  void _signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _setData();
      },
      child: Scaffold(
        // ? AppBar
        appBar: AppBar(
          title: Text(
            "Notes",
            textScaleFactor: 1.6,
          ),
          elevation: 0.0,
          backgroundColor: MyColors.bgColor,
          actions: [
            AppBarButton(
              icon: Icon(CupertinoIcons.add),
              tapProcess: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => AddScreen()));
              },
            )
          ],
        ),
        // ? Floating Action Button

        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
          child: notes.isNotEmpty
              ? NoteStaggeredGridLayout(data: notes)
              : Center(
                  child: Text(
                    "No Notes Yet...",
                    style: TextStyle(color: Colors.grey[400], fontSize: 25),
                  ),
                ),
        ),
      ),
    );
  }
}

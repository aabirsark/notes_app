import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/provider/user_data_provider.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/date_in_time_.dart';
import 'package:notes_app/widgets/app_bar_widget.dart';
import 'package:notes_app/widgets/custom_input_field.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key key}) : super(key: key);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final _documentReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: addScreenAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                CustomInputField(
                  controller: _titleController,
                  fontSize: 35,
                  hintText: "Title...",
                  fontWeight: true,
                ),
                CustomInputField(
                  hintText: "Subject...",
                  fontSize: 20,
                  controller: _subjectController,
                )
              ],
            ),
          ),
        ));
  }

  AppBar addScreenAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.bgColor,
      leading: AppBarButton(
        icon: Icon(CupertinoIcons.left_chevron),
        tapProcess: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0.0,
      actions: [
        AppBarButton(
          icon: Icon(Icons.save),
          tapProcess: () async {
            if (_subjectController.text.isEmpty &&
                _titleController.text.isEmpty) {
              print(
                  "can't be done , Fields are empty ===== caused by add notes screen");

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please complete both Fields")));
            } else {
              await _documentReference
                  .collection("Data")
                  .doc("${context.read<UserDataProvider>().user.uid}")
                  .collection("Notes")
                  .add({
                'title': _titleController.text,
                'description': _subjectController.text,
                'timestamp': Timestamp.fromDate(DateTime.now()),
                'date': getCurrentDate()
              });
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}

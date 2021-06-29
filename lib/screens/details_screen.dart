import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/dumy_data.dart';
import 'package:notes_app/widgets/app_bar_widget.dart';

class DetailsScreen extends StatelessWidget {
  
  final String title;
  final String date;
  final String desc;

  const DetailsScreen({Key key, this.title, this.date, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detalisAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: MainColumnOfDetails(title: title,date: date ,desc: desc, ),
        ),
      ),
    );
  }

  AppBar detalisAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.bgColor,
      elevation: .0,
      leading: AppBarButton(
        icon: Icon(CupertinoIcons.left_chevron),
        tapProcess: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        AppBarButton(icon: Icon(CupertinoIcons.pen), tapProcess: () {})
      ],
    );
  }
}

class MainColumnOfDetails extends StatelessWidget {
  final String title;
  final String date;
  final String desc;
  const MainColumnOfDetails({
    Key key,
     this.title, this.date, this.desc,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          textScaleFactor: 2.5,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(date),
        SizedBox(
          height: 20,
        ),
        Text(desc,
            softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20))
      ],
    );
  }
}

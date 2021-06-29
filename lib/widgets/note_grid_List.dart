import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/screens/details_screen.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/dumy_data.dart';

class NoteStaggeredGridLayout extends StatelessWidget {
  final data;
  const NoteStaggeredGridLayout({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = [
      MyColors.noteColor1,
      MyColors.noteColor2,
      MyColors.noteColor3,
      MyColors.noteColor4,
      MyColors.noteColor5
    ];
    return Container(
      child: new StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => DetailsScreen(
                          title: data[index]['title'],
                          date: data[index]['date'],
                          desc: data[index]['description'],
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colors[Random().nextInt(5)]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[index]['title'],
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 23)),
                  MyCustomDivider(),
                  Text(
                    data[index]['description'],
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data[index]['date'],
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                  )
                ],
              ),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}

class MyCustomDivider extends StatelessWidget {
  const MyCustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Divider(
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

class NotesData {
  final String noteTitle;
  final String noteSubject;
  final String noteLastUpdateDate;
  final Color notePrimaryColor;
  final String noteTag;

  NotesData(
      {@required this.noteTitle,
      @required this.noteSubject,
      @required this.noteLastUpdateDate,
      @required this.notePrimaryColor,
      @required this.noteTag});
}

class DumyData {
  static List<NotesData> dumyData = [
    NotesData(
        noteTitle: "Science First Chapter Notes",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor1,
        noteTag: "Study"),
    NotesData(
        noteTitle: "Flutter Firebase Auth and Cloud Notes",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor2,
        noteTag: "Tech"),
    NotesData(
        noteTitle: "Prati Didi Computer Error Details",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor3,
        noteTag: "Life"),
    NotesData(
        noteTitle: "Windows 11 Best Features and Bugs",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor5,
        noteTag: "Tech"),
    NotesData(
        noteTitle: "Tenetur incidunt qui.",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor4,
        noteTag: "Stuffs"),
    NotesData(
        noteTitle: "Public-key Italy",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor1,
        noteTag: "Fact"),
    NotesData(
        noteTitle: "driver generate connecting",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor3,
        noteTag: "Stuffs"),
    NotesData(
        noteTitle: "Legacy Factors Designer needed, Details",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor2,
        noteTag: "Stuffs"),
    NotesData(
        noteTitle: "Jesus Kohler notes for Social Science",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor4,
        noteTag: "Life"),
    NotesData(
        noteTitle: "Magni quis nam ",
        noteSubject: fakeText,
        noteLastUpdateDate: "24/07/2020",
        notePrimaryColor: MyColors.noteColor1,
        noteTag: "Stuffs"),
  ];
}

String fakeText =
    """Eum omnis impedit ratione dolorem nihil. Ab commodi laborum est. Et magni excepturi vel molestiae aliquam quia et ut. Corporis ut molestiae aut dicta.
 
Vel et dolorum quos quidem rerum sequi. Eius temporibus harum recusandae quia numquam velit magni consectetur aspernatur. Est et eius beatae error quae sit quas exercitationem. Odio et ratione repellendus dolores hic nihil molestias dolor autem. Vel corrupti consectetur illo fugiat.
 
Est dolorem possimus rerum voluptate beatae impedit similique dolorem. At dicta fugiat exercitationem in. Sit earum soluta quam et aut mollitia et magnam. Adipisci explicabo molestias. Exercitationem eum assumenda aut ut molestiae aut iusto a sint. Reprehenderit aut laudantium quia non libero iste aliquam esse asperiores.

Fugit aliquid aut molestiae iusto ducimus voluptas et. Quod aut quibusdam. Accusamus tempora eligendi laboriosam ullam labore est. Blanditiis rem officia tempora maxime culpa ipsa nesciunt accusamus. Et quod iste. Corrupti dolorum modi hic eos odio autem dicta illo.
 
Quo perferendis voluptas qui. Ut porro nihil et illo dolores veritatis molestiae nesciunt. Molestiae itaque quaerat consectetur tenetur omnis in sed. Commodi tenetur eum nihil.
 
Ducimus quod nostrum. Consequatur saepe sint totam. Quod officia quasi facere.

""";

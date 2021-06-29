import 'package:flutter/material.dart';
import 'package:notes_app/provider/user_data_provider.dart';
import 'package:notes_app/screens/home_page.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => UserDataProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
          fontFamily: GoogleFonts.ptSans().fontFamily,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: MyColors.bgColor),
      home: HomeScreen(),
    );
  }
}

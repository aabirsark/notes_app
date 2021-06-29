import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserDataProvider extends ChangeNotifier {
  User _user;

  // ? get value;
  User get user => _user;

  // ? setter
  void setUser(User user) {
    print("cahnges held");
    _user = user;
    notifyListeners();
  }
}

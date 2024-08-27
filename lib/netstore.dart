library net_store;

import 'dart:ui';

import 'package:netstore/page/login_screen.dart';

export 'package:netstore/page/login_screen.dart';

class NetStore {
  static LoginScreen homePage(
      {required String title,
      required String email,
      required String password,
      required Color appColor}) {
    return LoginScreen(
        title: title, email: email, password: password, appColor: appColor);
  }
}

library net_store;

import 'dart:ui';

import 'package:netstore/page/login_screen.dart';
import 'package:netstore/page/product_edit_screen.dart';

export 'package:netstore/page/login_screen.dart';
export 'package:netstore/page/product_edit_screen.dart';

class NetStore {
  static LoginScreen homePage(
      {required String title,
      required String email,
      required String password,
      required Color appColor,
      required void Function(String title, String category) onTap,
      required String image}) {
    return LoginScreen(
      title: title,
      email: email,
      password: password,
      appColor: appColor,
      onTap: onTap,
    );
  }

  static EditProduct editProduct({required Color color}) {
    return EditProduct(color: color);
  }
}

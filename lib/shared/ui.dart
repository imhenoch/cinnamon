import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void error(String errorMessage) {
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

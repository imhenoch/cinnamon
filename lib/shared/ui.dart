import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void notifyInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        fontSize: 16.0);
  }

  static void notifyError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

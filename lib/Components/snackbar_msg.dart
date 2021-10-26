import 'package:flutter/material.dart';

class CustomFunctions {
  final String msg;
  const CustomFunctions({@required this.msg});
  static snackbar(BuildContext context, String msg) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      backgroundColor: Color(0xff393939),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      behavior: SnackBarBehavior.floating,
      content: Text(
        '$msg',
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 3),
    ));
  }
}

import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context,
    {required double width, List<Widget>? actions, required String title}) {
  return AppBar(
    actions: actions,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
    title: Text(title),
  );
}

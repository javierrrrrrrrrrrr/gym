import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context,
    {required double width, List<Widget>? actions, required String title}) {
  return AppBar(
    centerTitle: true,
    actions: actions,
    leadingWidth: 50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
    title: Text(
      title,
      style: const TextStyle(fontSize: 25),
    ),
  );
}

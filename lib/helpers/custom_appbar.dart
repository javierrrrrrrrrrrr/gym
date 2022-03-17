import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context,
    {required double width,
    List<Widget>? actions,
    required String title,
    bool? centerTitle,
    Widget? leading}) {
  return AppBar(
    leading: leading,
    centerTitle: centerTitle,
    actions: actions,
    leadingWidth: 50,
    backgroundColor: const Color.fromRGBO(77, 82, 233, 1),
    title: Text(
      title,
      style: const TextStyle(fontSize: 25),
    ),
  );
}

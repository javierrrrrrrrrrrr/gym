import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context,
    {required double width,
    List<Widget>? actions,
    required String title,
    bool? centerTitle,
    Widget? leading,
    double? toolbarHeight,
    String? subtitle}) {
  return AppBar(
    toolbarHeight: toolbarHeight,
    leading: leading,
    centerTitle: centerTitle,
    actions: actions,
    leadingWidth: 50,
    backgroundColor: const Color.fromRGBO(77, 82, 233, 1),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
        if (subtitle != null)
          Text(
              "${subtitle.substring(0, 1).toUpperCase()}${subtitle.substring(1, subtitle.length)}",
              style: const TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ))
      ],
    ),
  );
}

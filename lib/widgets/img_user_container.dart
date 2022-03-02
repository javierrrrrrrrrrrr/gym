import 'package:flutter/material.dart';

class ImgUserContainer extends StatelessWidget {
  const ImgUserContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

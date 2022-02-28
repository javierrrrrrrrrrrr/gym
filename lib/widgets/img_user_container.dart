import 'package:flutter/material.dart';

class ImgUserContainer extends StatelessWidget {
  const ImgUserContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return child;
  }
}

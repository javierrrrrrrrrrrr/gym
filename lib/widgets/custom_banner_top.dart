import 'package:flutter/material.dart';

class BannerTop extends StatelessWidget {
  const BannerTop({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
  }) : super(key: key);
  final double height;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.zero,
        height: height * 0.07,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: const Color.fromRGBO(45, 49, 146, 1),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
            textScaleFactor: 1.85,
          ),
        ),
      ),
    );
  }
}
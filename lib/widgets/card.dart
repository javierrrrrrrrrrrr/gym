import 'package:flutter/material.dart';

class Carta extends StatelessWidget {
  const Carta({
    Key? key,
    required this.imgurl,
    required this.texto,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  final String texto;
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(45, 49, 146, 1),
        ),
        margin: EdgeInsets.only(left: width * 0.05),
        height: height * 0.3,
        width: width * 0.4,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.035),
              height: 120,
              width: 120,
              child: Image(
                image: AssetImage(imgurl),
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: height * 0.03, top: height * 0.01),
              child: Text(
                texto,
                style: const TextStyle(color: Colors.white),
                textScaleFactor: 1.5,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ));
  }
}

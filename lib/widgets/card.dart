import 'package:flutter/material.dart';

class Carta extends StatelessWidget {
  const Carta({
    Key? key,
    required this.imgurl,
    required this.texto,
  }) : super(key: key);

  final String texto;
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 5,
              spreadRadius: 1,
              //offset: Offset(1, 1)
            ),
          ],
          borderRadius: BorderRadius.circular(width * 0.06),
          color: const Color(0xffFFFFFF),
        ),
        height: height * 0.23,
        width: width * 0.4,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.035),
              height: height * 0.110,
              width: width * 0.25,
              child: Image(
                image: AssetImage(imgurl),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: height * 0.005),
              child: Center(
                child: Text(
                  texto,
                  style:
                      const TextStyle(color: Color(0xff898CE5), fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}

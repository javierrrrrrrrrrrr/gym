import 'package:flutter/material.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.08),
            height: height * 0.07,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: const Color.fromRGBO(45, 49, 146, 1),
            ),
            child: const Center(
              child: Text(
                'Panel de Administracion',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                textScaleFactor: 1.85,
              ),
            ),
          ),
          separador(),
          Row(
            children: [
              Carta(
                width: width,
                height: height,
                texto: "Gestion de clientes",
                imgurl: "assets/add_user.png",
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Carta(
                width: width,
                height: height,
                texto: "Gestion de Entrenador",
                imgurl: "assets/add_user.png",
              ),
            ],
          ),
          separador(),
          Row(
            children: [
              Carta(
                width: width,
                height: height,
                texto: "Gestion de clientes",
                imgurl: "assets/supplies.png",
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Carta(
                width: width,
                height: height,
                texto: "Gestion de Entrenador",
                imgurl: "assets/add_user.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget separador() {
  return const SizedBox(
    height: 45,
  );
}

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

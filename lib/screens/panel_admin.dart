import 'package:flutter/material.dart';

import 'package:gym/widgets/widgets.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
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
              child: const Center(
                child: Text(
                  'Panel de Administracion',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                  textScaleFactor: 1.85,
                ),
              ),
            ),
          ),
          separador(height),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'users');
                },
                child: Carta(
                  width: width,
                  height: height,
                  texto: "Gestion de clientes",
                  imgurl: "assets/add_user.png",
                ),
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
          separador(height),
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

Widget separador(double height) {
  return SizedBox(
    height: height * 0.075,
  );
}

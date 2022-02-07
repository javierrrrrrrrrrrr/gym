import 'package:flutter/material.dart';

import 'package:gym/widgets/widgets.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);
  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          BannerTop(
            height: height,
            width: width,
            title: "Panel de Administración",
          ),
          separador(height),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'users'),
                child: Carta(
                  width: width,
                  height: height,
                  texto: "Gestión de clientes",
                  imgurl: "assets/add_user.png",
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'trainers'),
                child: Carta(
                  width: width,
                  height: height,
                  texto: "Gestión de Entrenador",
                  imgurl: "assets/add_user.png",
                ),
              ),
            ],
          ),
          separador(height),
          Row(
            children: [
              Carta(
                width: width,
                height: height,
                texto: "Gestión de clientes",
                imgurl: "assets/supplies.png",
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Carta(
                width: width,
                height: height,
                texto: "Gestión de Entrenador",
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

import 'package:flutter/material.dart';

import '../../helpers/custom_appbar.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, width: width, title: "Estadisticas"),
      body: Column(children: [
        separador(),
        Contenedor('Clientes', '136'),
        separador(),
        Contenedor('Clientes Nuevos', '20'),
        separador(),
        Contenedor('Entrenadores', '20'),
        separador(),
        Contenedor('Entrenadores Nuevos', '20'),
        separador(),
        Contenedor('Ganancias del mes', '95000')
      ]),
    );
  }

  SizedBox separador() {
    return const SizedBox(
      height: 20,
    );
  }

  Container Contenedor(String texto, String numeros) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18),
      height: 120,
      width: 900,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset.zero,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(children: [
        const Image(
          image: AssetImage('assets/add_user.png'),
          color: Color.fromRGBO(137, 140, 229, 1),
        ),
        Column(
          children: [
            Text(
              texto,
              style: const TextStyle(
                  fontSize: 23, color: Color.fromRGBO(137, 140, 229, 1)),
            ),
            Text(
              numeros,
              style: const TextStyle(
                  fontSize: 25, color: Color.fromRGBO(137, 140, 229, 1)),
            ),
          ],
        ),
      ]),
    );
  }
}

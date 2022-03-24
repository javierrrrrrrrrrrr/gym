import 'package:flutter/material.dart';

class EstadisticaCard extends StatelessWidget {
  const EstadisticaCard(
      {Key? key,
      required this.texto,
      required this.numero,
      this.simbolo,
      required this.foto})
      : super(key: key);
  final String texto;
  final String numero;
  final bool? simbolo;
  final String foto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18),
      height: 120,
      width: 900,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(-1, -1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image(
            image: AssetImage('assets/$foto'),
            color: const Color.fromRGBO(137, 140, 229, 1),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromRGBO(137, 140, 229, 1)),
              ),
              Text(
                simbolo == true ? "\$-" + numero : numero,
                style: const TextStyle(
                    fontSize: 35,
                    color: Color.fromRGBO(137, 140, 229, 1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

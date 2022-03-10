import 'package:flutter/material.dart';
import 'package:gym/widgets/card.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.blue,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "DashBoard",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(diaSemana() + " " + devolverFecha(),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(43),
                      topRight: Radius.circular(43))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          await userProvider.getUsers().whenComplete(() {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'users');
                          });
                        },
                        child: const Carta(
                          texto: "Clientes",
                          imgurl: "assets/clients.png",
                        ),
                      ),
                      const Carta(
                        texto: "Entrenadores",
                        imgurl: "assets/trainers.png",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Carta(
                        texto: "Insumos",
                        imgurl: "assets/insumos.png",
                      ),
                      Carta(
                        texto: "Estadisticas",
                        imgurl: "assets/estadisticas.png",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String diaSemana() {
  int dia = DateTime.now().weekday;

  if (dia == 1) {
    return "Lunes";
  }
  if (dia == 2) {
    return "Martes";
  }
  if (dia == 3) {
    return "Miercoles";
  }
  if (dia == 4) {
    return "Jueves";
  }
  if (dia == 5) {
    return "Viernes";
  }
  if (dia == 6) {
    return "Sabado";
  }
  if (dia == 7) {
    return "Domingo";
  }

  return "";
}

String devolverFecha() {
  int day = DateTime.now().day;
  int mes = DateTime.now().month;
  int year = DateTime.now().year;

  return '$day/$mes/$year';
}

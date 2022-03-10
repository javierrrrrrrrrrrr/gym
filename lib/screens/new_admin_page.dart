import 'package:flutter/material.dart';
import 'package:gym/widgets/card.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String diaSemana() {
    String diasemana = '';
    setState(() {
      int dia = DateTime.now().weekday;

      if (dia == 1) {
        diasemana = "Lunes";
      }
      if (dia == 2) {
        diasemana = "Martes";
      }
      if (dia == 3) {
        diasemana = "Miércoles";
      }
      if (dia == 4) {
        diasemana = "Jueves";
      }
      if (dia == 5) {
        diasemana = "Viernes";
      }
      if (dia == 6) {
        diasemana = "Sábado";
      }
      if (dia == 7) {
        diasemana = "Domingo";
      }
    });

    return diasemana;
  }

  String devolverFecha() {
    String fecha = '';
    setState(() {
      int day = DateTime.now().day;
      int mes = DateTime.now().month;
      int year = DateTime.now().year;

      fecha = "$day/$mes/$year";
    });

    return fecha;
  }

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

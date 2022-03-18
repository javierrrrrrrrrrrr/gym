import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:gym/widgets/card.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
    final trainerProvider = Provider.of<TrainerProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          Text("${diaSemana()} ${devolverFecha()}",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white)),
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

                            try {
                              await userProvider.getUsers();
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'users');

                              await userProvider.getUsersSinPagar();
                            } on Exception catch (e) {
                              Navigator.pop(context);
                              print(e);
                              ElegantNotification.error(
                                toastDuration:
                                    const Duration(milliseconds: 3000),
                                animation: ANIMATION.fromTop,
                                title: const Text('Error'),
                                description:
                                    const Text('Problemas de conexion'),
                              ).show(context);
                            }
                          },
                          child: const Carta(
                            texto: "Clientes",
                            imgurl: "assets/clients.png",
                          ),
                        ),
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
                            try {
                              await trainerProvider.getTrainers();

                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'trainers');
                            } on Exception catch (e) {
                              Navigator.pop(context);
                              print(e);
                              ElegantNotification.error(
                                toastDuration:
                                    const Duration(milliseconds: 3000),
                                animation: ANIMATION.fromTop,
                                title: const Text('Error'),
                                description:
                                    const Text('Problemas de conexion'),
                              ).show(context);
                            }
                          },
                          child: const Carta(
                            texto: "Entrenadores",
                            imgurl: "assets/trainers.png",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ElegantNotification.info(
                              toastDuration: const Duration(milliseconds: 3000),
                              animation: ANIMATION.fromTop,
                              title: const Text('Upss!!'),
                              description: const Text(
                                  'Para mas informacion contacte a los desarrolladores'),
                            ).show(context);
                          },
                          child: const Carta(
                            texto: "Insumos",
                            imgurl: "assets/insumos.png",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ElegantNotification.info(
                              toastDuration: const Duration(milliseconds: 3000),
                              animation: ANIMATION.fromTop,
                              title: const Text('Upss!!'),
                              description: const Text(
                                  'Para mas informacion contacte a los desarrolladores'),
                            ).show(context);
                          },
                          child: const Carta(
                            texto: "Estadisticas",
                            imgurl: "assets/estadisticas.png",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/card.dart';
import 'package:provider/provider.dart';

class TrainerDasboard extends StatefulWidget {
  const TrainerDasboard({Key? key}) : super(key: key);

  @override
  State<TrainerDasboard> createState() => _TrainerDasboardState();
}

class _TrainerDasboardState extends State<TrainerDasboard> {
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
    final trainerProvider = Provider.of<TrainerProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: const Color.fromRGBO(45, 49, 146, 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 65),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                    AssetImage('assets/images.jpg'),
                              ),
                            )
                          ],
                        ),
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
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(43),
                        topRight: Radius.circular(43))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              await trainerProvider
                                  .getUsersByTrainerId(
                                      loginProvider.idUserLogin)
                                  .whenComplete(() {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, 'users-trainer');
                              });
                              //:TODO Hacer el Metodo de devolver la lista de users del trainer.
                            },
                            child: const Carta(
                              texto: "Clientes",
                              imgurl: "assets/clients.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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

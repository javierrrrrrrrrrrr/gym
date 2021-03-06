import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:gym/helpers/page_transitions.dart';
import 'package:gym/screens/pages.dart';
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
    final loginProvider = Provider.of<LoginProvider>(context);
    final imageProvider = Provider.of<SelectImg>(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: width * 0.7653,
              width: double.infinity,
              color: const Color.fromRGBO(45, 49, 146, 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: width * 0.16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.05),
                            child: Column(
                              children: [
                                if (imageProvider.imageAdminPath == "")
                                  (loginProvider.userloginImg !=
                                          "no-avatar.png")
                                      ? LoadImgFromApi(
                                          imageProvider: imageProvider,
                                          userProvider: userProvider,
                                          loginProvider: loginProvider)
                                      : NoImgFromApi(
                                          imageProvider: imageProvider,
                                          userProvider: userProvider,
                                          loginProvider: loginProvider)
                                else
                                  SelectImgFromCamara(
                                      imageProvider: imageProvider,
                                      userProvider: userProvider,
                                      loginProvider: loginProvider),
                                NameUserLogIn(loginProvider: loginProvider),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: width * 0.07639, left: width * 0.07639),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dashboard",
                            style: TextStyle(
                                fontSize: width * 0.07639, color: Colors.white),
                          ),
                          Text("${diaSemana()} ${devolverFecha()}",
                              style: TextStyle(
                                  fontSize: width * 0.04583,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: width * 0.6365),
              child: Container(
                height: width * 1.5278,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.115),
                        topRight: Radius.circular(width * 0.115))),
                child: Column(
                  children: [
                    SizedBox(
                      height: width * 0.15,
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

                              Navigator.push(context,
                                  crearRuta(screen: const UsersPage()));

                              await userProvider.getUsersSinPagar();
                            } on Exception {
                              Navigator.pop(context);

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
                              Navigator.push(context,
                                  crearRuta(screen: const TrainerPage()));
                            } on Exception {
                              Navigator.pop(context);

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
                    SizedBox(
                      height: width * 0.07639,
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
                          onTap: () async {
                            try {
                              await userProvider.mostrarestadisticas();
                              Navigator.push(context,
                                  crearRuta(screen: const Estadisticas()));
                            } on Exception {
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

class NameUserLogIn extends StatelessWidget {
  const NameUserLogIn({
    Key? key,
    required this.loginProvider,
  }) : super(key: key);

  final LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    return Text(loginProvider.userloginName,
        style: const TextStyle(fontSize: 15, color: Colors.white));
  }
}

class SelectImgFromCamara extends StatelessWidget {
  const SelectImgFromCamara({
    Key? key,
    required this.imageProvider,
    required this.userProvider,
    required this.loginProvider,
  }) : super(key: key);

  final SelectImg imageProvider;
  final UsersProvider userProvider;
  final LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await imageProvider.pickAdminImage();
          await userProvider.uploadImagenGenerica(
              imageProvider.imageAdminPath!, loginProvider.idUserLogin);

          imageProvider.imageAdminPath = "";
        } on Exception {
          // TODO
        }
      },
      child: SizedBox(
        height: 56,
        width: 56,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.file(
            imageProvider.imgAdmin!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class NoImgFromApi extends StatelessWidget {
  const NoImgFromApi({
    Key? key,
    required this.imageProvider,
    required this.userProvider,
    required this.loginProvider,
  }) : super(key: key);

  final SelectImg imageProvider;
  final UsersProvider userProvider;
  final LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await imageProvider.pickAdminImage();
          await userProvider.uploadImagenGenerica(
              imageProvider.imageAdminPath!, loginProvider.idUserLogin);
          imageProvider.imageAdminPath = "";
          // ignore: empty_catches
        } on Exception {}
      },
      child: const CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage('assets/images.jpg'),
      ),
    );
  }
}

class LoadImgFromApi extends StatelessWidget {
  const LoadImgFromApi({
    Key? key,
    required this.imageProvider,
    required this.userProvider,
    required this.loginProvider,
  }) : super(key: key);

  final SelectImg imageProvider;
  final UsersProvider userProvider;
  final LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await imageProvider.pickAdminImage();
          await userProvider.uploadImagenGenerica(
              imageProvider.imageAdminPath!, loginProvider.idUserLogin);
          imageProvider.imageAdminPath = "";
        } on Exception {
          null;
        }
      },
      child: SizedBox(
        height: 56,
        width: 56,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/images.jpg'),
            image: NetworkImage(
                'http://152.206.85.91:3000/api/uploads/users/${loginProvider.idUserLogin}'),
            placeholderFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym/helpers/page_transitions.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/screens/pages.dart';
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
    final userProvider = Provider.of<UsersProvider>(context);
    final trainerProvider = Provider.of<TrainerProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    final imageProvider = Provider.of<SelectImg>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
                                imageProvider.imagePath == ""
                                    ? (loginProvider.userloginImg !=
                                            "no-avatar.png")
                                        ? GestureDetector(
                                            onTap: () async {
                                              await imageProvider.pikeImage();
                                              await userProvider
                                                  .uploadImagenGenerica(
                                                      imageProvider.imagePath!,
                                                      loginProvider
                                                          .idUserLogin);
                                            },
                                            child: SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                                child: FadeInImage(
                                                  fit: BoxFit.cover,
                                                  placeholder: const AssetImage(
                                                      'assets/images.jpg'),
                                                  image: NetworkImage(
                                                      'http://181.225.253.122:3000/api/uploads/users/${loginProvider.idUserLogin}'),
                                                  placeholderFit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () async {
                                              await imageProvider.pikeImage();
                                              await userProvider
                                                  .uploadImagenGenerica(
                                                      imageProvider.imagePath!,
                                                      loginProvider
                                                          .idUserLogin);
                                            },
                                            child: const CircleAvatar(
                                              radius: 28,
                                              backgroundImage: AssetImage(
                                                  'assets/images.jpg'),
                                            ),
                                          )
                                    : GestureDetector(
                                        onTap: () async {
                                          await imageProvider.pikeImage();
                                          await userProvider
                                              .uploadImagenGenerica(
                                                  imageProvider.imagePath!,
                                                  loginProvider.idUserLogin);
                                        },
                                        child: SizedBox(
                                          height: 56,
                                          width: 56,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            child: Image.file(
                                              imageProvider.img!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                Text(loginProvider.userloginName,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white)),
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
                                Navigator.push(context,
                                    crearRuta(screen: const UsersByTrainer()));
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

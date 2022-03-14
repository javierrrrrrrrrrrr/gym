import 'package:flutter/material.dart';
import 'package:gym/helpers/custom_appbar.dart';
import 'package:gym/providers/Users/users_provider.dart';

import 'package:gym/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);
  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UsersProvider>(context);

    return Scaffold(
      appBar:
          customAppbar(context, width: width, title: "Panel de Administracion"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            separador(height),
            Row(
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
                    texto: "Gestión de clientes",
                    imgurl: "assets/add_user.png",
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                GestureDetector(
                  // onTap: () => Navigator.pushNamed(context, 'trainers'),
                  child: const Carta(
                    texto: "Gestión de Entrenador",
                    imgurl: "assets/add_user.png",
                  ),
                ),
              ],
            ),
            separador(height),
            Row(
              children: [
                const Carta(
                  texto: "Gestión de clientes",
                  imgurl: "assets/supplies.png",
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                const Carta(
                  texto: "Gestión de Entrenador",
                  imgurl: "assets/add_user.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget separador(double height) {
  return SizedBox(
    height: height * 0.075,
  );
}

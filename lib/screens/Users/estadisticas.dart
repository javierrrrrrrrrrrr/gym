import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/estadistica_card.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_appbar.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({Key? key}) : super(key: key);
  String devolverFecha() {
    String fecha = '';

    int day = DateTime.now().day;
    int mes = DateTime.now().month;
    int year = DateTime.now().year;

    fecha = "$day/$mes/$year";

    return fecha;
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final userProvider = Provider.of<UsersProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context,
          width: width,
          title: "Estadisticas",
          subtitle: "actualizadas ${devolverFecha()}",
          toolbarHeight: width * 0.19,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: width * 0.05,
              ),
              child: CircleAvatar(
                radius: width * 0.0650,
                backgroundImage: const AssetImage('assets/images.jpg'),
                foregroundImage: NetworkImage(
                    'http://152.206.85.91:3000/api/uploads/users/${loginProvider.idUserLogin}'),
              ),
            ),
          ]),
      body: RefreshIndicator(
        onRefresh: () => refresh(context),
        child: ListView(
          children: [
            separador(width),
            EstadisticaCard(
                texto: 'Clientes', numero: userProvider.clients, foto: '1.png'),
            separador(width),
            EstadisticaCard(
                texto: 'Clientes Nuevos',
                numero: userProvider.newclients,
                foto: '2.png'),
            separador(width),
            EstadisticaCard(
                texto: 'Entrenadores',
                numero: userProvider.trainers,
                foto: '3.png'),
            separador(width),
            EstadisticaCard(
                texto: 'Entrenadores Nuevos',
                numero: userProvider.newtrainers,
                foto: '4.png'),
            separador(width),
            EstadisticaCard(
                simbolo: true,
                texto: 'Ganancias del mes',
                numero: userProvider.newpayments,
                foto: '5.png'),
            separador(width),
          ],
        ),
      ),
    );
  }

  SizedBox separador(var width) {
    return SizedBox(
      height: width * 0.05,
    );
  }

  Future<void> refresh(BuildContext context) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    await userProvider.mostrarestadisticas();
  }
}

import 'package:flutter/material.dart';
import 'package:gym/providers/providers.dart';
import 'package:gym/widgets/estadistica_card.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_appbar.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final userProvider = Provider.of<UsersProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context,
          width: width,
          title: "Estadisticas",
          subtitle: "actualizadas el 20/20/2022",
          toolbarHeight: 70,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: const AssetImage('assets/images.jpg'),
                foregroundImage: NetworkImage(
                    'http://181.225.253.122:3000/api/uploads/users/${loginProvider.idUserLogin}'),
              ),
            ),
          ]),
      body: RefreshIndicator(
        onRefresh: () => refresh(context),
        child: ListView(
          children: [
            separador(),
            EstadisticaCard(
                texto: 'Clientes', numero: userProvider.clients, foto: '1.png'),
            separador(),
            EstadisticaCard(
                texto: 'Clientes Nuevos',
                numero: userProvider.newclients,
                foto: '2.png'),
            separador(),
            EstadisticaCard(
                texto: 'Entrenadores',
                numero: userProvider.trainers,
                foto: '3.png'),
            separador(),
            EstadisticaCard(
                texto: 'Entrenadores Nuevos',
                numero: userProvider.newtrainers,
                foto: '4.png'),
            separador(),
            EstadisticaCard(
                simbolo: true,
                texto: 'Ganancias del mes',
                numero: userProvider.newpayments,
                foto: '5.png'),
            separador(),
          ],
        ),
      ),
    );
  }

  SizedBox separador() {
    return const SizedBox(
      height: 20,
    );
  }

  Future<void> refresh(BuildContext context) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    await userProvider.Mostrarestadisticas();
  }
}

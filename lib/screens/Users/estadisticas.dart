import 'package:flutter/material.dart';
import 'package:gym/providers/login_provider.dart';
import 'package:gym/widgets/estadistica_card.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_appbar.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
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
        onRefresh: _refresh,
        child: ListView(
          children: [
            separador(),
            const EstadisticaCard(texto: 'Clientes', numero: '136'),
            separador(),
            const EstadisticaCard(texto: 'Clientes Nuevos', numero: '20'),
            separador(),
            const EstadisticaCard(texto: 'Entrenadores', numero: '20'),
            separador(),
            const EstadisticaCard(texto: 'Entrenadores Nuevos', numero: '20'),
            separador(),
            const EstadisticaCard(
                simbolo: true, texto: 'Ganancias del mes', numero: '95000'),
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

  Future<void> _refresh() async {
    // TODO:Hacer el metodo que llame desde el api
  }
}

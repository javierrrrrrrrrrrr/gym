import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class ListaPagos extends StatelessWidget {
  const ListaPagos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          CustomNav(
            titulo: "Lista de Pagos",
            height: height,
            width: width,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
        onPressed: () {
          Navigator.pushNamed(context, 'pago');
        },
        child: const Icon(
          Icons.payments_outlined,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class ListaPagos extends StatelessWidget {
  const ListaPagos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomNav(
            title: "Lista de Pagos",
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

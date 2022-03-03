import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class ListaObservaciones extends StatelessWidget {
  const ListaObservaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: const [
            CustomNav(
              title: "Lista de observaciones",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(45, 49, 146, 1),
          onPressed: () {
            Navigator.pushNamed(context, 'ob');
          },
          child: const Icon(
            Icons.remove_red_eye_sharp,
            size: 35,
            color: Colors.white,
          ),
        ));
  }
}

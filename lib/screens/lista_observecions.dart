import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class ListaObservaciones extends StatelessWidget {
  const ListaObservaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
          children: [
            CustomNav(
              titulo: "Lista de observaciones",
              height: height,
              width: width,
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

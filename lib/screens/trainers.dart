import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingABCustom(
        width: width,
        route: "add_trainer",
      ),
      body: Column(
        children: [
          CustomNav(
            titulo: "Gestion de Entrenadores",
            height: height,
            width: width,
          ),
          ListViewPage(height: height)
        ],
      ),
    );
  }
}

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
    return Scaffold(
      floatingActionButton: const FloatingABCustom(
        route: "add_trainer",
      ),
      body: Column(
        children: const [
          CustomNav(
            title: "Gestion de Entrenadores",
          ),
          ListViewTrainers()
        ],
      ),
    );
  }
}

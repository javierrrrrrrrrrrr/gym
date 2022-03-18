import 'package:flutter/material.dart';
import 'package:gym/widgets/widgets.dart';
import '../../helpers/custom_appbar.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppbar(
          context,
          width: width,
          title: "Entrenadores",
          leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.arrow_back)),
          actions: [],
        ),
        body: Column(
          children: const [ListViewTrainers()],
        ),
        floatingActionButton: const FloatingABCustom(
          isTrainer: true,
          route: "add_trainer",
        ));
  }
}
